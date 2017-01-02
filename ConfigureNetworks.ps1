#NETWORK-RECONFIG
# ****************REMOVES DHCP & SETS STATIC IP**********

Get-NetIPInterface
#************************************************

$IFIndex=Read-Host -Prompt "Enter Interface Index You would like to Configure from the above"

$DesiredIPAddress=Read-Host -Prompt "Please Enter An IP Address To Configure"

$IPPrefix=Read-Host -Prompt "Enter an IPv4 Subnet Prefix"

$Gateway=Read-Host -Prompt "Enter Default Gateway Address"

$DNS =Read-Host -Prompt "Enter DNS Server Address"

Set-NetIPInterface -Dhcp Disabled
New-NetIPAddress -IPAddress $DesiredIPAddress -InterfaceIndex $IFIndex -PrefixLength $IPPrefix -DefaultGateway $Gateway
Set-NetConnectionProfile -InterfaceIndex $IFIndex -NetworkCategory Private
Set-DnsClientServerAddress -InterfaceIndex $IFIndex -ServerAddresses $DNS
