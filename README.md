# Jupyter & Jupyterhub 
## Building Statistics Classrooms for the cloud - Szeged, September 2017

##  Building the Docker image

In order to build the Docker image used in the demos, run the following command from the root of the repository.

```bash
docker build -t jupyterhub-szeged ./jupyterhub/
```

## Running locally

After the building is done, you can either run the *run-jupyterhub-standalone.sh* command or, the following:

```bash
docker run -td -p 8000:8000 --name jhub jupyterhub-szeged
```

## Deploying in the cloud

Using Google container engine, go to the console and clone the project, running the following commands:

```bash
cd gcloud-deploy
kubectl create -f rc-file.yaml
kubectl create -f service-file.yaml
```

Then, wait for the service to be up using the command:

```bash
kubectl get services --watch
```