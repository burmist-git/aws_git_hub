#!/bin/bash

########################################################################
#                                                                      #
# Copyright(C) 2020 - LBS - (Single person developer.)                 #
# Thu Jun  4 16:40:53 CEST 2020                                        #
# Autor: Leonid Burmistrov                                             #
#                                                                      #
# File description:                                                    #
#                                                                      #
# Input paramete:                                                      #
#                                                                      #
# This software is provided "as is" without any warranty.              #
#                                                                      #
########################################################################

function log_ec2_sh {
    ssh -i $pkey ubuntu@$awsmachine
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d  : default"
    echo " -p2 : second parameter"
}

#awsmachine='ec2-18-219-9-31.us-east-2.compute.amazonaws.com'
#awsmachine='ec2-18-191-115-142.us-east-2.compute.amazonaws.com'
#awsmachine='ec2-3-23-132-134.us-east-2.compute.amazonaws.com'
awsmachine='ec2-13-58-161-58.us-east-2.compute.amazonaws.com'

pkey='/home/burmist/home2/aws_test/ami/ami01_private_key.pem'

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
            log_ec2_sh
    elif [ "$1" = "-p2" ]; then
	echo " $1 "
    else
        printHelp
    fi
fi
