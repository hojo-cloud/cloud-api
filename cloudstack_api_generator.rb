#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'json'

# CloudStack version
#major = '2.2.0'
#minor = '2.2.14'
major = '3.0.0'
minor = '3.0.0'

# Cloud.com URL for API doc
url_root = "http://download.cloud.com/releases/#{major}/api_#{minor}"
url_toc  = "#{url_root}/TOC_Root_Admin.html"  # table of contents

# hash to store api commands and arrays of params
commands = {}

# fetch the document (table of contents)
doc_toc = Nokogiri::HTML(open(url_toc))

# iterate over every list item,
# which contains a hyperlink to an api command
#
doc_toc.xpath("//li//a").each do |href|
  path = href.values[0]           # get target of hyperlink
  base = href.children[0].text    # get label (child) of href

  puts "====> #{base}"
  #begin 
    # fetch api document
    doc_cmd = Nokogiri::HTML(open("#{url_root}/#{path}"))
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

  # Create a new key in our hash that points to an array.
  #
  # the key name will be the api command name;
  # the array it points to will contain arrays of parameter info:
  #
  #   {
  #     'apiName' => [
  #       [ 'param1', 'description1', 'boolean' ],
  #       [ 'param2', 'description2', 'boolean' ],
  #       [ 'param3', 'description3', 'boolean' ]
  #     ],
  #   }
  #   
  base.gsub!(/\s.*$/, '')       # strip " (A)" from the command name first
  commands[base] = Array.new    # now create the key

  # Iterate over each parameter and clean up the data,
  # then shove the arrays into the hash
  #
  names.each_with_index do |name, idx|
    name = name.to_s.chomp                # remove newlines
    desc = descs[idx].to_s.chomp          #
    bool = bools[idx].to_s.chomp          #

    [name,desc,bool].each do |data|
      data.gsub!(/<[^>]*>/, '')           # remove html tags
    end

    puts "#{name} (#{bool}) - #{desc}"    # print info to stdout
    commands[base] << [name, desc, bool]  # append the array to our key
  end #each param
  puts
end #each command

# Write the JSON file
#
begin
  File.open("cloudstack_api_#{minor}.json", "w") do |fh|
    fh.write(commands.to_json)
  end
rescue => e
  puts "Couldn't write JSON object to CWD!: #{e.message}"
  puts "\nTrying to write it to /tmp instead..."
  File.open("/tmp/cloudstack_api_#{minor}.json", "w") do |fh|
    fh.write(commands.to_json)
  end
end
