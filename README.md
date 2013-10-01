cloud-api
=========

Shell script to run arbitrary CloudStack API commands locally on your CS
management server.  You can tab complete every CloudStack API command as well
as every parameter for every command. :)

(Also included are scripts to generate the programmable completion)

Usage
-----

    usage: cloud-api <command> [<param>[=<value]] ...

    commands and params may be tab-completed.
    if you install the `highlight' program, output will be colored.

For example:

    [root@cs-mgmt:~]# cloud-api list<TAB>
    listAccounts                    listOsCategories 
    listAlerts                      listOsTypes 
    listAsyncJobs                   listPods 
    listCapabilities                listPools 
    listCapacity                    listPortForwardingRules 
    listClusters                    listPublicIpAddresses 
    listConfigurations              listRemoteAccessVpns 
    listDiskOfferings               listResourceLimits 
    listDomainChildren              listRouters 
    listDomains                     listSecurityGroups 
    listEvents                      listServiceOfferings 
    listEventTypes                  listSnapshotPolicies 
    listExternalFirewalls           listSnapshots 
    listExternalLoadBalancers       listSSHKeyPairs 
    listFirewallRules               listStoragePools 
    listHosts                       listSystemVms 
    listHypervisors                 listTemplatePermissions 
    listInstanceGroups              listTemplates 
    listIpForwardingRules           listTrafficMonitors 
    listIsoPermissions              listUsageRecords 
    listIsos                        listUsers 
    listLoadBalancerRuleInstances   listVirtualMachines 
    listLoadBalancerRules           listVlanIpRanges 
    listLunsOnFiler                 listVolumes 
    listNetworkDevice               listVolumesOnFiler 
    listNetworkOfferings            listVpnUsers 
    listNetworks                    listZones 
    [root@cs-mgmt:~]# cloud-api listVol<TAB>
    [root@cs-mgmt:~]# cloud-api listVolumes <TAB>
    account=           isrecursive=       pagesize=          zoneid=
    domainid=          keyword=           podid=             
    hostid=            name=              type=              
    id=                page=              virtualmachineid=  
    [root@cs-mgmt:~]# cloud-api listVolumes key<TAB>
    [root@cs-mgmt:~]# cloud-api listVolumes keyword=
    [root@cs-mgmt:~]# cloud-api listVolumes keyword=root
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <listvolumesresponse cloud-stack-version="2.2.14.20120210101530">
      <count>1</count>
      <volume>
        <id>757</id>
        <name>ROOT-500</name>
        <zoneid>1</zoneid>
        <zonename>zone1</zonename>
        <type>ROOT</type>
        <deviceid>0</deviceid>
        <virtualmachineid>500</virtualmachineid>
        <vmname>i-3-500-VM</vmname>
        <vmdisplayname>dns01.nyc.mydomain.com</vmdisplayname>
        <vmstate>Running</vmstate>
        <size>10737418240</size>
        <created>2012-06-28T15:57:28-0700</created>
        <state>Ready</state>
        <account>account1</account>
        <domainid>1</domainid>
        <domain>ROOT</domain>
        <storagetype>shared</storagetype>
        <hypervisor>XenServer</hypervisor>
        <storage>storage1</storage>
        <destroyed>false</destroyed>
        <serviceofferingid>1</serviceofferingid>
        <serviceofferingname>Small Instance</serviceofferingname>
        <serviceofferingdisplaytext>Small Instance, $0.05 per hour</serviceofferingdisplaytext>
        <isextractable>false</isextractable>
      </volume>
    </listvolumesresponse>
    [root@cs-mgmt:~]#

Installation
------------

This project is unpackaged, so just copy a couple files into place:

    [root@cs-mgmt:~]# mv cloud-api /usr/local/bin
    [root@cs-mgmt:~]# mv cloud-api-comp.sh /etc/profile.d

If you want syntax highlighting, install the `highlight` package from the EPEL
repo:

    [root@cs-mgmt:~]# yum -y install highlight  #optional; from epel

Logout and log back in and see if you can tab-complete `cloud-api`
arguments... (If you can't, you might need to tune your `~/.bashrc` to explicitly
source the `cloud-api-comp.sh` file.)

Generating the API
------------------

If you want to regenerate the `cloud-api-comp.sh` or `cloudstack_api_XXX.json`
files, install the `nokogiri`, `json`, and `erubis` gems.  Then run the scripts
like so:

    $ ./cloudstack_api_generator.rb

That should generate a JSON file called `cloudstack_api_2.2.14.json`.
Then to generate the bash completion function:

    ./bash_comp_generator.rb cloudstack_api_2.2.14.json > cloud-api-comp.sh

Bugs
----

The generator scripts may not work with Ruby 1.8.x ...haven't tried.
    
