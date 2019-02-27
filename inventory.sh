#!/bin/bash

# Get Tag Number (Last 4 digits of HostName)
tagNumber=${netName: (-7)}
echo Tag Number: $tagNumber

# Manufacturer
Manufacturer=Apple
echo Manufacturer: $Manufacturer

# Serial Number
serialNumber=$(system_profiler SPHardwareDataType | awk '/Serial/ {print $4}')
echo Serial Number: $serialNumber

# CPU
processor=$(sysctl -n machdep.cpu.brand_string | awk '{printf $6" "$3}')
echo Processor: $processor

# RAM
memory=$(system_profiler SPHardwareDataType | grep " Memory:")
echo Memory: $memory

# Hard Drive size in GB
hdSize=$(df -H | grep 'disk1s1' | awk '{printf $2}')
echo Storage: $hdSize

# Operating System Version
SystemVersion=$(sw_vers | grep 'ProductVersion' | awk '{print $2}')
echo Operating System: $SystemVersion
# Netname
netName=$(scutil --get HostName)
echo Net Name: $netName

# Ethenet Hardware Address
ethernetAddress=$(networksetup -listallhardwareports | \
                  grep --after-context=2 'Hardware Port: Ethernet' | \
                  grep 'Ethernet Address:' | \
                  awk '{print $3}')
echo Ethernet MAC: $ethernetAddress

# Wireless Hardware Address
WirelessAddress=$(networksetup -listallhardwareports | \
                  grep --after-context=2 'Wi-Fi' | \
                  grep 'Ethernet Address:' | \
                  awk '{print $3}')
echo Wi-Fi MAC: $WirelessAddress
