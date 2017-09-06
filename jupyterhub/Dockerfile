FROM jupyterhub/jupyterhub

COPY hello.ipynb /opt/hello.ipynb


# copy a build script that does all the creation magic
COPY buildscript.sh /opt/buildscript.sh
RUN bash /opt/buildscript.sh

