#!/bin/bash
# install jupyter first
function setupNbGrader() {    
    # remove existing directory, so we can start fresh for demo purposes
    rm -rf /tmp/exchange

    # create the exchange directory, with write permissions for everyone
    mkdir /tmp/exchange
    chmod ugo+rw /tmp/exchange
}

function doInstall() {
    apt-get update && \
        apt-get install sudo nano
    conda install jupyter 
    conda install -c conda-forge nbgrader
    jupyter nbextension install --sys-prefix --py nbgrader --overwrite
    jupyter nbextension enable --sys-prefix --py nbgrader
    jupyter serverextension enable --sys-prefix --py nbgrader

    # disable creation for all students
    jupyter nbextension disable --sys-prefix formgrader/main --section=tree
    jupyter serverextension disable --sys-prefix nbgrader.server_extensions.formgrader
    jupyter nbextension disable --sys-prefix create_assignment/main

     mkdir -p /tmp/exchange
     chmod ugo+rw /tmp/exchange
     mkdir -p /usr/local/etc/jupyter
     cp /opt/nbgrader_config.py /usr/local/etc/jupyter
     chmod ugo+rw /usr/local/etc/jupyter
}

function createUsers(){
        for i in {1..40}
        do
        useradd -ms /bin/bash "newuser$i"
        echo newuser$i:1234 | chpasswd

        mkdir -p /home/newuser$i/.jupyter/
        cp /opt/hello.ipynb /home/newuser$i
        cp /opt/.bashrc /home/newuser$i
        cp /opt/nbgrader_config.py /home/newuser$i/.jupyter/
        chown -hR newuser$i:newuser$i /home/newuser$i
        echo "Created newuser$i"

        done
        useradd -ms /bin/bash teacher
        echo teacher:1234 | chpasswd
        adduser teacher sudo
        # copy files for the teacher 
        cp /opt/.bashrc /home/teacer
        cp /opt/nbgrader_config.py /home/teacher/.jupyter/
        chown -hR teacher:teacher /home/teacher
        echo "Created the teacher account"
}

setupNbGrader
doInstall
echo "Done installing Jupyter notebooks...creating users..."
createUsers

