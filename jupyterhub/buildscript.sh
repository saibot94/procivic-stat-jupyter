#!/bin/bash
# install jupyter first

function doInstall() {
    conda install jupyter 
}

function createUsers(){
        for i in {1..40}
        do
        useradd -ms /bin/bash "newuser$i"
        echo newuser$i:1234 | chpasswd

        cp /opt/hello.ipynb /home/newuser$i
        chown newuser$i /home/newuser$i/hello.ipynb
        echo "Created newuser$i"
        done
}

createUsers
doInstall