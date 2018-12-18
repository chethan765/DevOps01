#!/bin/bash

echo -----------------------------------------------------------------



function get_CPU ()  {
    echo -------CPU INFORMATION----
    sysctl -n hw.ncpu
    #number cpus/cores, information about the cpus/core
    system_profiler SPHardwareDataType
}



function get_RAM () {
    echo -------RAM INFORMATION----
    #number of volumes, size of each volume, free space on each volume
    system_profiler SPHardwareDataType | grep "  Memory:"
    
}

function get_volume () {
     echo -------VOLUME INFORMATION----
     
    #number of volumes, size of each volume, free space on each volume
    df -h
    
}

function get_network () {

    echo -------GET NETWORK INFORMATION----
    #Machine address and ip
    ifconfig en0

}


case "$1" in
"-volumes")
  
    get_volume;;
"-cpu")
    get_CPU;;
   
"-ram")
    get_RAM;;
    
"-all")
    get_volume
    get_network
    get_RAM
    get_CPU;;
    
"-network")
    get_network;;


esac









