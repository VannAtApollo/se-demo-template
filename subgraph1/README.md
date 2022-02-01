# Subgraph 1 - "Authors"

## Prereqs

 1. Install needed npm packages locally: `npm install`
 2. Edit .env to add your Graph Reference, Subgraph name, Graph ID, and Routing URL.

## Run Schema Checks

```
make check
```

## Run Locally

```
node server.js
```

## Deploy to GCP

```
make deploy
```

## Publish Schema

```
make publish
```

## Files

 * .env/dot_env - stores environmental variables that are used for deployment
 * .gcloudignore - makes Google Cloud ignore certain files
 * cloudbuild.yaml - the configuration file for Google Cloud Build which will build and deploy Docker containers and services in GCP
 * Dockerfile - the file used to build a Docker container locally or in Cloud Build
 * Makefile - a collection of command shortcuts
 * package.json - package requirements for a NodeJS project
 * server.js - the Apollo Server (subgraph) code
 * database.json - the static "database" data for this service
 * schema.graphql - the GraphQL schema (subgraph) for this service
