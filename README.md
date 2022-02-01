# SE Demo Template

Use this template to quickly build and deploy a Federated demo environment.

## Prereqs

 1. Install Docker for Mac
 2. Install Homebrew & Python 3: https://docs.python-guide.org/starting/install3/osx/
 3. Install NVM for Mac: https://tecadmin.net/install-nvm-macos-with-homebrew/ 
 4. Install NodeJS v16.13.1 using NVM: `nvm install v16.13.1`
 5. Use NodeJS v16.13.1: `nvm use v16.13.1`
 6. Install the Apollo CLI: https://www.apollographql.com/docs/devtools/cli/
 7. Install the Rover CLI: https://www.apollographql.com/docs/rover/
 8. Log into Studio and create a Deployed Graph, get an API Key and note your Graph ID and Variant ID
 9. Run `make install-deps` to install npm packages for each subgraph and to rename dot_env to .env (this will overwrite current .env files)
 10. Edit the .env file in ./gateway, ./subgraph1, ./subgraph2, ./subgraph3 to fill in the appropriate variables

## Run it Locally with Unmanaged Federation (Local Composition)

`make run-local-unmanaged`

## Run it Locally with Managed Federation

`make run-local-managed`

## Deploy everything to GCP

### Initial Setup (this only happens once)

 1. Install the Google Cloud CLI: https://cloud.google.com/sdk/docs/quickstart
 2. Login to the Google Cloud Console and create a new project
    1. Go to https://console.cloud.google.com/
    2. Click "New Project"
    3. Name your new project `<your-last-name>-presales-demo`
    4. In your new project click on the menu and select "Cloud Run" from the list.
    5. Click "Enable Cloud Run API"
 3. Authenticate with Google Cloud using your Apollo email: `gcloud init`
 4. In the folder ./gateway, ./subgraph1, ./subgraph2, and ./subgraph3 folders edit the `cloudbuild.yaml` file to use your correct project name (replace the <CHANGE_ME> in each of those).

### How to deploy

 1. Deploy your gateway and subgraphs with `make deploy`
 2. Check the Google Cloud Run Console to see the URLs for each of your services and your gateway.
 3. Update the `.env` files in ./subgraph1, ./subgraph2, ./subgraph3 to have the right `ROUTING_URL` that you got from Cloud Run dashboard.
 4. Run `make publish` (this will run `make publish` in each of your subgraph directories, you can also run those one by one)
 5. Update studio with the right URL for your gateway.

 Steps 2, 3, and 5 should only need to be done the first time.  After that you can just use `make deploy` and `make publish`

## Generate Traffic

 1. Update the `client/client.py` file to have the right URL for your gateway (if you change your schema you will need to update the queries in this file).
 2. Update the `.github/workflows/client_gen.yaml` file to have the correct cron string.
 3. Commit and deploy your code to your forked repo and GitHub Actions will start generating traffic for your site.


## Files & Directories

 * _.github/_ - configuration for GitHub Actions (CI/CD)
 * _client/_ - a simple client app to send GQL queries to your demo
 * _gateway/_ - the Apollo Gateway for this demo
 * _subgraph1/_ - a subgraph for this demo
 * _subgraph2/_ - a subgraph for this demo
 * _subgraph3/_ - a subgraph for this demo
 * _.gitignore_ - files that git should not manage
 * _local-test-unmanaged.yaml_ - a config file for Docker Compose to run an unmanaged Federation demo
 * _local-test.yaml_ - a config file for Docker Compose to run a managed Federation demo
 * _Makefile_ - a collection of command shortcuts
 * _supergraph.yaml_ - the config file that Rover uses to create a supergraph offline (ie, without Studio)

## Make it your own

Change the schemas for each of the subgraphs and update the data in the `database.json` files.  In each `server.js` make sure you have the right resolvers for the queries and/or mutations on your graph. 