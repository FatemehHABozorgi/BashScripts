#!/bin/bash

lsblk

echo -e "\nEnter y or n:"

read var

if [[ "$var" == "y" ]]
    then
    echo "#####################################################################"
    pvcreate /dev/sdc
    echo "#####################################################################"
    vgextend vgdata /dev/sdc
    echo "#####################################################################"
    lvextend -l +95%FREE /dev/vgdata/lvdata
    echo "#####################################################################"
    xfs_growfs /dev/mapper/vgdata-lvdata
    echo "#####################################################################"
    lsblk
    echo "#####################################################################"
    fdisk -l
    echo "#####################################################################"
    df -h
    echo "Done :)"
fi