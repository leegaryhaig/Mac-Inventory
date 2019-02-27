#!/bin/bash

# Netname
netName=$(scutil --get HostName)
echo Net Name: $netName

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

ethernetAddress=$(ifconfig en0 | grep -w 'ether'| awk '{print $2}')
echo Ethernet MAC: $ethernetAddress

WirelessAddress=$(ifconfig )
