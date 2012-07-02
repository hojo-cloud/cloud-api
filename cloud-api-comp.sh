_cloud_api()
{
    local cur prev words cword
    #_init_completion || return  # requires bash-completion package and bash 4

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cword="${COMP_CWORD}"

    local api_commands=(
        addCluster
        addExternalFirewall
        addExternalLoadBalancer
        addHost
        addNetworkDevice
        addSecondaryStorage
        addTrafficMonitor
        addVpnUser
        assignToLoadBalancerRule
        associateIpAddress
        associateLun
        attachIso
        attachVolume
        authorizeSecurityGroupIngress
        cancelHostMaintenance
        cancelStorageMaintenance
        changeServiceForRouter
        changeServiceForVirtualMachine
        configureSimulator
        copyIso
        copyTemplate
        createAccount
        createConfiguration
        createDiskOffering
        createDomain
        createFirewallRule
        createInstanceGroup
        createIpForwardingRule
        createLoadBalancerRule
        createLunOnFiler
        createNetwork
        createPod
        createPool
        createPortForwardingRule
        createRemoteAccessVpn
        createSSHKeyPair
        createSecurityGroup
        createServiceOffering
        createSnapshot
        createSnapshotPolicy
        createStoragePool
        createTemplate
        createUser
        createVlanIpRange
        createVolume
        createVolumeOnFiler
        createZone
        deleteAccount
        deleteCluster
        deleteDiskOffering
        deleteDomain
        deleteExternalFirewall
        deleteExternalLoadBalancer
        deleteFirewallRule
        deleteHost
        deleteInstanceGroup
        deleteIpForwardingRule
        deleteIso
        deleteLoadBalancerRule
        deleteNetwork
        deleteNetworkDevice
        deletePod
        deletePool
        deletePortForwardingRule
        deleteRemoteAccessVpn
        deleteSSHKeyPair
        deleteSecurityGroup
        deleteServiceOffering
        deleteSnapshot
        deleteSnapshotPolicies
        deleteStoragePool
        deleteTemplate
        deleteTrafficMonitor
        deleteUser
        deleteVlanIpRange
        deleteVolume
        deleteZone
        deployVirtualMachine
        destroyLunOnFiler
        destroyRouter
        destroySystemVm
        destroyVirtualMachine
        destroyVolumeOnFiler
        detachIso
        detachVolume
        disableAccount
        disableStaticNat
        disableUser
        disassociateIpAddress
        dissociateLun
        enableAccount
        enableStaticNat
        enableStorageMaintenance
        enableUser
        extractIso
        extractTemplate
        extractVolume
        generateUsageRecords
        getCloudIdentifier
        getVMPassword
        listAccounts
        listAlerts
        listAsyncJobs
        listCapabilities
        listCapacity
        listClusters
        listConfigurations
        listDiskOfferings
        listDomainChildren
        listDomains
        listEventTypes
        listEvents
        listExternalFirewalls
        listExternalLoadBalancers
        listFirewallRules
        listHosts
        listHypervisors
        listInstanceGroups
        listIpForwardingRules
        listIsoPermissions
        listIsos
        listLoadBalancerRuleInstances
        listLoadBalancerRules
        listLunsOnFiler
        listNetworkDevice
        listNetworkOfferings
        listNetworks
        listOsCategories
        listOsTypes
        listPods
        listPools
        listPortForwardingRules
        listPublicIpAddresses
        listRemoteAccessVpns
        listResourceLimits
        listRouters
        listSSHKeyPairs
        listSecurityGroups
        listServiceOfferings
        listSnapshotPolicies
        listSnapshots
        listStoragePools
        listSystemVms
        listTemplatePermissions
        listTemplates
        listTrafficMonitors
        listUsageRecords
        listUsers
        listVirtualMachines
        listVlanIpRanges
        listVolumes
        listVolumesOnFiler
        listVpnUsers
        listZones
        login
        logout
        migrateSystemVm
        migrateVirtualMachine
        modifyPool
        prepareHostForMaintenance
        prepareTemplate
        queryAsyncJobResult
        rebootRouter
        rebootSystemVm
        rebootVirtualMachine
        reconnectHost
        recoverVirtualMachine
        registerIso
        registerSSHKeyPair
        registerTemplate
        registerUserKeys
        removeFromLoadBalancerRule
        removeVpnUser
        resetPasswordForVirtualMachine
        restartNetwork
        revokeSecurityGroupIngress
        startRouter
        startSystemVm
        startVirtualMachine
        stopRouter
        stopSystemVm
        stopVirtualMachine
        updateAccount
        updateCluster
        updateConfiguration
        updateDiskOffering
        updateDomain
        updateHost
        updateHostPassword
        updateInstanceGroup
        updateIso
        updateIsoPermissions
        updateLoadBalancerRule
        updateNetwork
        updateNetworkOffering
        updatePod
        updateResourceCount
        updateResourceLimit
        updateServiceOffering
        updateTemplate
        updateTemplatePermissions
        updateUser
        updateVirtualMachine
        updateZone
        uploadCustomCertificate
    )
    
    local IFS=$'\n,'

    if [[ $cword -eq 1 ]]
    then
        string=`echo ${api_commands[*]} | sed -e 's/ / ,/g' -e 's/$/ /'`
        COMPREPLY=( $(compgen -W "$string" -- "$cur") )
        return 0

    elif [[ $cword -gt 1 ]]
    then
        [[ $cword -eq 2 ]] && cmd=$prev
        case $cmd in
            -h|--help)
                return 0
                ;;
            addCluster)
                local options=(
                    clustername=
                    clustertype=
                    hypervisor=
                    zoneid=
                    allocationstate=
                    password=
                    podid=
                    url=
                    username=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addExternalFirewall)
                local options=(
                    password=
                    url=
                    username=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addExternalLoadBalancer)
                local options=(
                    password=
                    url=
                    username=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addHost)
                local options=(
                    hypervisor=
                    password=
                    url=
                    username=
                    zoneid=
                    allocationstate=
                    clusterid=
                    clustername=
                    hosttags=
                    podid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addNetworkDevice)
                local options=(
                    networkdeviceparameterlist=
                    networkdevicetype=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addSecondaryStorage)
                local options=(
                    url=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addTrafficMonitor)
                local options=(
                    url=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            addVpnUser)
                local options=(
                    password=
                    username=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            assignToLoadBalancerRule)
                local options=(
                    id=
                    virtualmachineids=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            associateIpAddress)
                local options=(
                    zoneid=
                    account=
                    domainid=
                    networkid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            associateLun)
                local options=(
                    iqn=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            attachIso)
                local options=(
                    id=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            attachVolume)
                local options=(
                    id=
                    virtualmachineid=
                    deviceid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            authorizeSecurityGroupIngress)
                local options=(
                    account=
                    cidrlist=
                    domainid=
                    endport=
                    icmpcode=
                    icmptype=
                    protocol=
                    securitygroupid=
                    securitygroupname=
                    startport=
                    usersecuritygrouplist=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            cancelHostMaintenance)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            cancelStorageMaintenance)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            changeServiceForRouter)
                local options=(
                    id=
                    serviceofferingid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            changeServiceForVirtualMachine)
                local options=(
                    id=
                    serviceofferingid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            configureSimulator)
                local options=(
                    name=
                    value=
                    clusterid=
                    hostid=
                    podid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            copyIso)
                local options=(
                    id=
                    destzoneid=
                    sourcezoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            copyTemplate)
                local options=(
                    id=
                    destzoneid=
                    sourcezoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createAccount)
                local options=(
                    accounttype=
                    email=
                    firstname=
                    lastname=
                    password=
                    username=
                    account=
                    domainid=
                    networkdomain=
                    timezone=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createConfiguration)
                local options=(
                    category=
                    component=
                    instance=
                    name=
                    description=
                    value=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createDiskOffering)
                local options=(
                    displaytext=
                    name=
                    customized=
                    disksize=
                    domainid=
                    tags=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createDomain)
                local options=(
                    name=
                    networkdomain=
                    parentdomainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createFirewallRule)
                local options=(
                    ipaddressid=
                    protocol=
                    cidrlist=
                    endport=
                    icmpcode=
                    icmptype=
                    startport=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createInstanceGroup)
                local options=(
                    name=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createIpForwardingRule)
                local options=(
                    ipaddressid=
                    protocol=
                    startport=
                    cidrlist=
                    endport=
                    openfirewall=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createLoadBalancerRule)
                local options=(
                    algorithm=
                    name=
                    privateport=
                    publicport=
                    account=
                    cidrlist=
                    description=
                    domainid=
                    openfirewall=
                    publicipid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createLunOnFiler)
                local options=(
                    name=
                    size=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createNetwork)
                local options=(
                    displaytext=
                    name=
                    networkofferingid=
                    zoneid=
                    account=
                    domainid=
                    endip=
                    gateway=
                    isdefault=
                    isshared=
                    netmask=
                    networkdomain=
                    startip=
                    tags=
                    vlan=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createPod)
                local options=(
                    gateway=
                    name=
                    netmask=
                    startip=
                    zoneid=
                    allocationstate=
                    endip=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createPool)
                local options=(
                    algorithm=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createPortForwardingRule)
                local options=(
                    ipaddressid=
                    privateport=
                    protocol=
                    publicport=
                    virtualmachineid=
                    cidrlist=
                    openfirewall=
                    privateendport=
                    publicendport=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createRemoteAccessVpn)
                local options=(
                    publicipid=
                    account=
                    domainid=
                    iprange=
                    openfirewall=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createSSHKeyPair)
                local options=(
                    name=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createSecurityGroup)
                local options=(
                    name=
                    account=
                    description=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createServiceOffering)
                local options=(
                    cpunumber=
                    cpuspeed=
                    displaytext=
                    memory=
                    name=
                    domainid=
                    hosttags=
                    issystem=
                    limitcpuuse=
                    networkrate=
                    offerha=
                    storagetype=
                    systemvmtype=
                    tags=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createSnapshot)
                local options=(
                    volumeid=
                    account=
                    domainid=
                    policyid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createSnapshotPolicy)
                local options=(
                    intervaltype=
                    maxsnaps=
                    schedule=
                    timezone=
                    volumeid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createStoragePool)
                local options=(
                    name=
                    url=
                    zoneid=
                    clusterid=
                    details=
                    podid=
                    tags=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createTemplate)
                local options=(
                    displaytext=
                    name=
                    ostypeid=
                    bits=
                    details=
                    isfeatured=
                    ispublic=
                    passwordenabled=
                    requireshvm=
                    snapshotid=
                    templatetag=
                    url=
                    virtualmachineid=
                    volumeid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createUser)
                local options=(
                    account=
                    email=
                    firstname=
                    lastname=
                    password=
                    username=
                    domainid=
                    timezone=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createVlanIpRange)
                local options=(
                    startip=
                    account=
                    domainid=
                    endip=
                    forvirtualnetwork=
                    gateway=
                    netmask=
                    networkid=
                    podid=
                    vlan=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createVolume)
                local options=(
                    name=
                    account=
                    diskofferingid=
                    domainid=
                    size=
                    snapshotid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createVolumeOnFiler)
                local options=(
                    aggregatename=
                    ipaddress=
                    password=
                    poolname=
                    size=
                    username=
                    volumename=
                    snapshotpolicy=
                    snapshotreservation=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            createZone)
                local options=(
                    dns1=
                    internaldns1=
                    name=
                    networktype=
                    allocationstate=
                    dns2=
                    domain=
                    domainid=
                    guestcidraddress=
                    internaldns2=
                    securitygroupenabled=
                    vlan=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteAccount)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteCluster)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteDiskOffering)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteDomain)
                local options=(
                    id=
                    cleanup=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteExternalFirewall)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteExternalLoadBalancer)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteFirewallRule)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteHost)
                local options=(
                    id=
                    forced=
                    forcedestroylocalstorage=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteInstanceGroup)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteIpForwardingRule)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteIso)
                local options=(
                    id=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteLoadBalancerRule)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteNetwork)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteNetworkDevice)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deletePod)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deletePool)
                local options=(
                    poolname=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deletePortForwardingRule)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteRemoteAccessVpn)
                local options=(
                    publicipid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteSSHKeyPair)
                local options=(
                    name=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteSecurityGroup)
                local options=(
                    account=
                    domainid=
                    id=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteServiceOffering)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteSnapshot)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteSnapshotPolicies)
                local options=(
                    id=
                    ids=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteStoragePool)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteTemplate)
                local options=(
                    id=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteTrafficMonitor)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteUser)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteVlanIpRange)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteVolume)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deleteZone)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            deployVirtualMachine)
                local options=(
                    serviceofferingid=
                    templateid=
                    zoneid=
                    account=
                    diskofferingid=
                    displayname=
                    domainid=
                    group=
                    hostid=
                    hypervisor=
                    ipaddress=
                    iptonetworklist=
                    keyboard=
                    keypair=
                    name=
                    networkids=
                    securitygroupids=
                    securitygroupnames=
                    size=
                    userdata=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            destroyLunOnFiler)
                local options=(
                    path=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            destroyRouter)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            destroySystemVm)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            destroyVirtualMachine)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            destroyVolumeOnFiler)
                local options=(
                    aggregatename=
                    ipaddress=
                    volumename=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            detachIso)
                local options=(
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            detachVolume)
                local options=(
                    deviceid=
                    id=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            disableAccount)
                local options=(
                    account=
                    domainid=
                    lock=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            disableStaticNat)
                local options=(
                    ipaddressid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            disableUser)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            disassociateIpAddress)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            dissociateLun)
                local options=(
                    iqn=
                    path=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            enableAccount)
                local options=(
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            enableStaticNat)
                local options=(
                    ipaddressid=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            enableStorageMaintenance)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            enableUser)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            extractIso)
                local options=(
                    id=
                    mode=
                    zoneid=
                    url=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            extractTemplate)
                local options=(
                    id=
                    mode=
                    zoneid=
                    url=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            extractVolume)
                local options=(
                    id=
                    mode=
                    zoneid=
                    url=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            generateUsageRecords)
                local options=(
                    enddate=
                    startdate=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            getCloudIdentifier)
                local options=(
                    userid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            getVMPassword)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listAccounts)
                local options=(
                    accounttype=
                    domainid=
                    id=
                    iscleanuprequired=
                    isrecursive=
                    keyword=
                    name=
                    page=
                    pagesize=
                    state=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listAlerts)
                local options=(
                    id=
                    keyword=
                    page=
                    pagesize=
                    type=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listAsyncJobs)
                local options=(
                    account=
                    domainid=
                    keyword=
                    page=
                    pagesize=
                    startdate=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listCapabilities)
                local options=(
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listCapacity)
                local options=(
                    hostid=
                    keyword=
                    page=
                    pagesize=
                    podid=
                    type=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listClusters)
                local options=(
                    allocationstate=
                    clustertype=
                    hypervisor=
                    id=
                    keyword=
                    managedstate=
                    name=
                    page=
                    pagesize=
                    podid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listConfigurations)
                local options=(
                    category=
                    keyword=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listDiskOfferings)
                local options=(
                    domainid=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listDomainChildren)
                local options=(
                    id=
                    isrecursive=
                    keyword=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listDomains)
                local options=(
                    id=
                    keyword=
                    level=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listEventTypes)
                local options=(
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listEvents)
                local options=(
                    account=
                    domainid=
                    duration=
                    enddate=
                    entrytime=
                    id=
                    keyword=
                    level=
                    page=
                    pagesize=
                    startdate=
                    type=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listExternalFirewalls)
                local options=(
                    zoneid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listExternalLoadBalancers)
                local options=(
                    keyword=
                    page=
                    pagesize=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listFirewallRules)
                local options=(
                    account=
                    domainid=
                    id=
                    ipaddressid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listHosts)
                local options=(
                    allocationstate=
                    clusterid=
                    details=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                    podid=
                    state=
                    type=
                    virtualmachineid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listHypervisors)
                local options=(
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listInstanceGroups)
                local options=(
                    account=
                    domainid=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listIpForwardingRules)
                local options=(
                    account=
                    domainid=
                    id=
                    ipaddressid=
                    keyword=
                    page=
                    pagesize=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listIsoPermissions)
                local options=(
                    id=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listIsos)
                local options=(
                    account=
                    bootable=
                    domainid=
                    hypervisor=
                    id=
                    isofilter=
                    ispublic=
                    isready=
                    keyword=
                    name=
                    page=
                    pagesize=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listLoadBalancerRuleInstances)
                local options=(
                    id=
                    applied=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listLoadBalancerRules)
                local options=(
                    account=
                    domainid=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                    publicipid=
                    virtualmachineid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listLunsOnFiler)
                local options=(
                    poolname=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listNetworkDevice)
                local options=(
                    keyword=
                    networkdeviceparameterlist=
                    networkdevicetype=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listNetworkOfferings)
                local options=(
                    availability=
                    displaytext=
                    guestiptype=
                    id=
                    isdefault=
                    isshared=
                    keyword=
                    name=
                    page=
                    pagesize=
                    specifyvlan=
                    traffictype=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listNetworks)
                local options=(
                    account=
                    domainid=
                    id=
                    isdefault=
                    isshared=
                    issystem=
                    keyword=
                    page=
                    pagesize=
                    traffictype=
                    type=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listOsCategories)
                local options=(
                    id=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listOsTypes)
                local options=(
                    id=
                    keyword=
                    oscategoryid=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listPods)
                local options=(
                    allocationstate=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listPools)
                local options=(
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listPortForwardingRules)
                local options=(
                    account=
                    domainid=
                    id=
                    ipaddressid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listPublicIpAddresses)
                local options=(
                    account=
                    allocatedonly=
                    domainid=
                    forloadbalancing=
                    forvirtualnetwork=
                    id=
                    ipaddress=
                    keyword=
                    page=
                    pagesize=
                    vlanid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listRemoteAccessVpns)
                local options=(
                    publicipid=
                    account=
                    domainid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listResourceLimits)
                local options=(
                    account=
                    domainid=
                    id=
                    keyword=
                    page=
                    pagesize=
                    resourcetype=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listRouters)
                local options=(
                    account=
                    domainid=
                    hostid=
                    id=
                    keyword=
                    name=
                    networkid=
                    page=
                    pagesize=
                    podid=
                    state=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listSSHKeyPairs)
                local options=(
                    fingerprint=
                    keyword=
                    name=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listSecurityGroups)
                local options=(
                    account=
                    domainid=
                    id=
                    keyword=
                    page=
                    pagesize=
                    securitygroupname=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listServiceOfferings)
                local options=(
                    domainid=
                    id=
                    issystem=
                    keyword=
                    name=
                    page=
                    pagesize=
                    systemvmtype=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listSnapshotPolicies)
                local options=(
                    volumeid=
                    account=
                    domainid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listSnapshots)
                local options=(
                    account=
                    domainid=
                    id=
                    intervaltype=
                    isrecursive=
                    keyword=
                    name=
                    page=
                    pagesize=
                    snapshottype=
                    volumeid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listStoragePools)
                local options=(
                    clusterid=
                    id=
                    ipaddress=
                    keyword=
                    name=
                    page=
                    pagesize=
                    path=
                    podid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listSystemVms)
                local options=(
                    hostid=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                    podid=
                    state=
                    systemvmtype=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listTemplatePermissions)
                local options=(
                    id=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listTemplates)
                local options=(
                    templatefilter=
                    account=
                    domainid=
                    hypervisor=
                    id=
                    keyword=
                    name=
                    page=
                    pagesize=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listTrafficMonitors)
                local options=(
                    zoneid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listUsageRecords)
                local options=(
                    enddate=
                    startdate=
                    account=
                    accountid=
                    domainid=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listUsers)
                local options=(
                    account=
                    accounttype=
                    domainid=
                    id=
                    keyword=
                    page=
                    pagesize=
                    state=
                    username=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listVirtualMachines)
                local options=(
                    account=
                    domainid=
                    forvirtualnetwork=
                    groupid=
                    hostid=
                    hypervisor=
                    id=
                    isrecursive=
                    keyword=
                    name=
                    networkid=
                    page=
                    pagesize=
                    podid=
                    state=
                    storageid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listVlanIpRanges)
                local options=(
                    account=
                    domainid=
                    forvirtualnetwork=
                    id=
                    keyword=
                    networkid=
                    page=
                    pagesize=
                    podid=
                    vlan=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listVolumes)
                local options=(
                    account=
                    domainid=
                    hostid=
                    id=
                    isrecursive=
                    keyword=
                    name=
                    page=
                    pagesize=
                    podid=
                    type=
                    virtualmachineid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listVolumesOnFiler)
                local options=(
                    poolname=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listVpnUsers)
                local options=(
                    account=
                    domainid=
                    id=
                    keyword=
                    page=
                    pagesize=
                    username=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            listZones)
                local options=(
                    available=
                    domainid=
                    id=
                    keyword=
                    page=
                    pagesize=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            login)
                local options=(
                    username=
                    password=
                    domain=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            logout)
                local options=(
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            migrateSystemVm)
                local options=(
                    hostid=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            migrateVirtualMachine)
                local options=(
                    hostid=
                    virtualmachineid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            modifyPool)
                local options=(
                    algorithm=
                    poolname=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            prepareHostForMaintenance)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            prepareTemplate)
                local options=(
                    templateid=
                    zoneid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            queryAsyncJobResult)
                local options=(
                    jobid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            rebootRouter)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            rebootSystemVm)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            rebootVirtualMachine)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            reconnectHost)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            recoverVirtualMachine)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            registerIso)
                local options=(
                    displaytext=
                    name=
                    url=
                    zoneid=
                    account=
                    bootable=
                    domainid=
                    isextractable=
                    isfeatured=
                    ispublic=
                    ostypeid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            registerSSHKeyPair)
                local options=(
                    name=
                    publickey=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            registerTemplate)
                local options=(
                    displaytext=
                    format=
                    hypervisor=
                    name=
                    ostypeid=
                    url=
                    zoneid=
                    account=
                    bits=
                    checksum=
                    details=
                    domainid=
                    isextractable=
                    isfeatured=
                    ispublic=
                    passwordenabled=
                    requireshvm=
                    templatetag=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            registerUserKeys)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            removeFromLoadBalancerRule)
                local options=(
                    id=
                    virtualmachineids=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            removeVpnUser)
                local options=(
                    username=
                    account=
                    domainid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            resetPasswordForVirtualMachine)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            restartNetwork)
                local options=(
                    id=
                    cleanup=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            revokeSecurityGroupIngress)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            startRouter)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            startSystemVm)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            startVirtualMachine)
                local options=(
                    id=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            stopRouter)
                local options=(
                    id=
                    forced=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            stopSystemVm)
                local options=(
                    id=
                    forced=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            stopVirtualMachine)
                local options=(
                    id=
                    forced=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateAccount)
                local options=(
                    account=
                    domainid=
                    newname=
                    networkdomain=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateCluster)
                local options=(
                    id=
                    allocationstate=
                    clustername=
                    clustertype=
                    hypervisor=
                    managedstate=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateConfiguration)
                local options=(
                    name=
                    value=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateDiskOffering)
                local options=(
                    id=
                    displaytext=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateDomain)
                local options=(
                    id=
                    name=
                    networkdomain=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateHost)
                local options=(
                    id=
                    allocationstate=
                    hosttags=
                    oscategoryid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateHostPassword)
                local options=(
                    password=
                    username=
                    clusterid=
                    hostid=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateInstanceGroup)
                local options=(
                    id=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateIso)
                local options=(
                    id=
                    bootable=
                    displaytext=
                    format=
                    name=
                    ostypeid=
                    passwordenabled=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateIsoPermissions)
                local options=(
                    id=
                    accounts=
                    isextractable=
                    isfeatured=
                    ispublic=
                    op=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateLoadBalancerRule)
                local options=(
                    id=
                    algorithm=
                    description=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateNetwork)
                local options=(
                    id=
                    displaytext=
                    name=
                    networkdomain=
                    tags=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateNetworkOffering)
                local options=(
                    availability=
                    displaytext=
                    id=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updatePod)
                local options=(
                    id=
                    allocationstate=
                    endip=
                    gateway=
                    name=
                    netmask=
                    startip=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateResourceCount)
                local options=(
                    domainid=
                    account=
                    resourcetype=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateResourceLimit)
                local options=(
                    resourcetype=
                    account=
                    domainid=
                    max=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateServiceOffering)
                local options=(
                    id=
                    displaytext=
                    name=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateTemplate)
                local options=(
                    id=
                    bootable=
                    displaytext=
                    format=
                    name=
                    ostypeid=
                    passwordenabled=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateTemplatePermissions)
                local options=(
                    id=
                    accounts=
                    isextractable=
                    isfeatured=
                    ispublic=
                    op=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateUser)
                local options=(
                    id=
                    email=
                    firstname=
                    lastname=
                    password=
                    timezone=
                    userapikey=
                    username=
                    usersecretkey=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateVirtualMachine)
                local options=(
                    id=
                    displayname=
                    group=
                    haenable=
                    ostypeid=
                    userdata=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            updateZone)
                local options=(
                    id=
                    allocationstate=
                    details=
                    dhcpprovider=
                    dns1=
                    dns2=
                    dnssearchorder=
                    domain=
                    guestcidraddress=
                    internaldns1=
                    internaldns2=
                    ispublic=
                    name=
                    vlan=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
            uploadCustomCertificate)
                local options=(
                    certificate=
                    domainsuffix=
                    id=
                    name=
                    privatekey=
                )
                COMPREPLY=( $( compgen -W "${options[*]}" -- "$cur" ) )
                return 0
                ;;
        esac
    fi
    return 0

} &&
complete -F _cloud_api -o nospace cloud-api
