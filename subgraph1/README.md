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
gcloud builds submit
```

## Publish Schema

```
make publish
```