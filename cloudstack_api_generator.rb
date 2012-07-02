#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'json'

#major = '3.0.0'
#minor = '3.0.0'
major = '2.2.0'
minor = '2.2.14'

url_root = "http://download.cloud.com/releases/#{major}/api_#{minor}"
url_toc  = "#{url_root}/TOC_Root_Admin.html"

# This hash will contain all api command names as keys,
# which will point to arrays of parameters
#
commands = {}

doc_toc = Nokogiri::HTML(open(url_toc))
doc_toc.xpath("//li//a").each do |href|

  path = href.values[0]
  base = path.gsub(/.*\//, '').gsub(/\.html/, '')

  puts "========================================================="
  puts "Fetching #{base} ..."
  puts "========================================================="

  url_cmd = "#{url_root}/#{path}"

  #begin 
    doc_cmd = Nokogiri::HTML(open(url_cmd))
  #rescue
  #end

  # Use Xpath to find all info in both tables (Parameters and Responses).
  #
  # we actually don't care about the response table, but there's
  # no way to filter it using xpath afaict since it's indistinguishable
  # from the parameters table (they both have identical attributes).
  # so we'll just filter it using some ruby below.
  # 
  names = doc_cmd.xpath("//table/tr/td[1]").to_a
  descs = doc_cmd.xpath("//table/tr/td[2]").to_a
  bools = doc_cmd.xpath("//table/tr/td[3]").to_a

  # Throw away the second table
  #
  # find the position of the second table header in the array and
  # delete everything after it
  #
  stop = nil
  names.each_with_index do |name, idx|
    if name.children.to_s =~ /Response Name/
      stop = idx
      break
    end
  end
  [names,descs,bools].each do |a|
    a.slice!(stop..-1)
    a.slice!(0) # also ditch the header on the first table
  end

  commands[base] = Array.new

  # Iterate over each parameter and clean up the data
  # then shove the arrays into the hash
  #
  names.each_with_index do |name, idx|
    name = name.to_s.chomp
    desc = descs[idx].to_s.chomp
    bool = bools[idx].to_s.chomp

    [name,desc,bool].each do |data|
      data.gsub!(/<[^>]*>/, '')
    end

    puts "#{name} (#{bool}) - #{desc}"
    commands[base] << [name, desc, bool]
  end #each param
  puts
end #each command

# Write the file
begin
  File.open("cloudstack_api_#{minor}.json", "w") do |fh|
    fh.write(commands.to_json)
  end
rescue => e
  puts "Couldn't write JSON object to disk!: #{e.message}"
  puts "\nTrying to write it to /tmp instead..."
  File.open("/tmp/cloudstack_api_#{minor}.json", "w") do |fh|
    fh.write(commands.to_json)
  end
end
