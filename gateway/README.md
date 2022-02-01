# Gateway

## Prereqs

 1. Install needed npm packages locally: `npm install`
 2. Edit .env to add your Apollo API key and Graph Reference.


## Run Locally

```
node server.js
```

## Deploy to GCP

```
gcloud builds submit
```

## Files

 * .env/dot_env - stores environmental variables that are used for deployment
 * .gcloudignore - makes Google Cloud ignore certain files
 * cloudbuild.yaml - the configuration file for Google Cloud Build which will build and deploy Docker containers and services in GCP
 * Dockerfile - the file used to build a Docker container locally or in Cloud Build
 * Dockerfile.unmanaged - an unmanaged Federation gateway container
 * Makefile - a collection of command shortcuts
 * package.json - package requirements for a NodeJS project
 * server-unmanaged.js - the Apollo Gateway using unmanaged Federation
 * server.js - the Apollo Gateway code