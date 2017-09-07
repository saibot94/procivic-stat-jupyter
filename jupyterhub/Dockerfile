FROM jupyterhub/jupyterhub

ADD . /opt/


# copy a build script that does all the creation magic
COPY buildscript.sh /opt/buildscript.sh
RUN bash /opt/buildscript.sh

# create the nbgrader coure
USER teacher
WORKDIR /home/teacher
RUN bash /opt/teacher_config.sh

USER root
WORKDIR /srv/jupyterhub
