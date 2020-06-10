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

function setup_aws_sh {
    install_emacs
    install_anaconda
}

function install_emacs {
    sudo apt-get update; sudo apt-get install emacs;
}

function install_anaconda {
    wget http://repo.continuum.io/archive/Anaconda3-2020.02-Linux-x86_64.sh
    bash Anaconda3-2020.02-Linux-x86_64.sh
}

function setup_jupyter_notebook {
    #source ~/.bashrc
    #which python3
    jupyter notebook --generate-config
    mkdir certs
    cd certs/
    sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
    sudo chown ubuntu mycert.pem
    sudo chmod a-w mycert.pem
    sudo chmod a-r mycert.pem
    sudo chmod a-x mycert.pem
    sudo chmod u+r mycert.pem
    ls -lrt
    cd ../
    #echo "setup_jupyter_notebook"
    #-->~/.jupyter/jupyter_notebook_config.py
    echo "c = get_config()" >> $py_config_file  
    echo "# Notebook config this is where you saved your pem cert" >> $py_config_file
    echo "c.NotebookApp.certfile = u'/home/ubuntu/aws_test/certs/mycert.pem'" >> $py_config_file
    echo "# Run on all IP addresses of your instance" >> $py_config_file
    echo "c.NotebookApp.ip = '*'" >> $py_config_file
    echo "# Don't open browser by default" >> $py_config_file
    echo "c.NotebookApp.open_browser = False" >> $py_config_file
    echo "# Fix port to 8888" >> $py_config_file
    echo "c.NotebookApp.port = 8888" >> $py_config_file
}

function install_Jre_pip_py4j_Scala {
    sudo apt-get update
    sudo apt-get install default-jre
    java -version
    sudo apt-get install scala
    scala -version
    conda install pyspark 
    #wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb
    #sudo dpkg -i scala-2.11.8.deb
    #wget http://www.scala-lang.org/files/archive/scala-2.13.2.deb
    #sudo dpkg -i scala-2.13.2.deb
    #export PATH=$PATH:$HOME/anaconda3/bin
    #conda install pip
    #which pip
    #pip install py4j
    #pip install pyspark 
    #conda install pyspark 
    #wget http://archive.apache.org/dist/spark/spark-2.0.0/spark-2.0.0-bin-hadoop2.7.tgz
    #sudo tar -zxvf spark-2.0.0-bin-hadoop2.7.tgz
    #wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz
    #sudo tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz
    #mv spark-2.4.5-bin-hadoop2.7 ../.
    #rm -rf spark-2.4.5-bin-hadoop2.7.tgz
    #export SPARK_HOME='/home/ubuntu/spark-2.4.5-bin-hadoop2.7'
    #export PATH=$SPARK_HOME:$PATH
    #export PYTHONPATH=$SPARK_HOME/python:$PYTHONPATH
}

function printHelp {
    echo " --> ERROR in input arguments "
    echo " -d : default"
    echo " -s : setup_jupyter_notebook"
    echo " -i : install_Jre_pip_py4j_Scala"
}

py_config_file='/home/ubuntu/.jupyter/jupyter_notebook_config.py'

if [ $# -eq 0 ]; then
    printHelp
else
    if [ "$1" = "-d" ]; then
        setup_aws_sh
    elif [ "$1" = "-s" ]; then
	setup_jupyter_notebook
    elif [ "$1" = "-i" ]; then
	install_Jre_pip_py4j_Scala
    else
        printHelp
    fi
fi
