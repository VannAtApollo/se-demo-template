# SE Demo Template

Use this template to quickly build and deploy a Federated demo environment.

## Prereqs

 1. Check out this repository (forking is disabled, sorry)
 2. Install Docker for Mac
 3. Install Homebrew & Python 3: https://docs.python-guide.org/starting/install3/osx/
 4. Install NVM for Mac: https://tecadmin.net/install-nvm-macos-with-homebrew/ 
 5. Install NodeJS v16.13.1 using NVM: `nvm install v16.13.1`
 6. Use NodeJS v16.13.1: `nvm use v16.13.1`
 7. Install the Apollo CLI: https://www.apollographql.com/docs/devtools/cli/
 8. Install the Rover CLI: https://www.apollographql.com/docs/rover/
 9. Log into Studio and create a Deployed Graph, get an API Key and note your Graph ID and Variant ID
 10. Run `make install-deps` to install npm packages for each subgraph and to rename dot_env to .env and cloudbuild.yaml.tmpl to cloudbuild.yaml (this will NOT overwrite current .env files)
 11. Edit the .env file in ./gateway, ./subgraph1, ./subgraph2, ./subgraph3 to fill in the appropriate variables __OR__ use the setup tool by typing `make setup`

## Run it Locally with Unmanaged Federation (Local Composition)

`make run-local-unmanaged`

## Run it Locally with Managed Federation

 1. Publish your schemas to Apollo
    1. Edit the `ROUTING_URL` in each of the subgraph directories `.env` file:  ./subgraph1, ./subgraph2, ./subgraph3 __OR__ run `make setup` again to set them.
    2. Publish your graph with `make publish`
 2. Deploy locally: `make run-local-managed`

## Deploy everything to GCP

### Initial Setup (this only happens once)

 1. Install the Google Cloud CLI: https://cloud.google.com/sdk/docs/quickstart
 2. Login to the Google Cloud Console and create a new project
    1. Go to https://console.cloud.google.com/
    2. Find the __"Sales Engineering"__ folder by searching in the drop down and then click "New Project" the "Location" needs to be "Sales Engineering"
    3. Name your new project `<your-last-name>-demo`
    4. In your new project click on the menu and select "Cloud Run" from the list.
    5. Click "Enable Cloud Run API"
    6. In your new project click on the menu and select "Cloud Build" from the list.
    7. Under the "Settings" area enable the "Cloud Run Admin" Role.
 3. Authenticate with Google Cloud from a terminal on your Mac using your Apollo email: `gcloud init` (if you ever need to change your default project name use the command `gcloud config set project <project-name>`)
 4. In the folder ./gateway, ./subgraph1, ./subgraph2, and ./subgraph3 folders edit the `cloudbuild.yaml` file to use your correct project name (replace the <CHANGE_ME> in each of those) __OR__ use the setup tool by typing `make setup`

### How to deploy

 1. Deploy your gateway and subgraphs with `make deploy`
 2. Check the Google Cloud Run Console to see the URLs for each of your services and your gateway.
 3. Update the `.env` files in ./subgraph1, ./subgraph2, ./subgraph3 to have the right `ROUTING_URL` that you got from Cloud Run dashboard __OR__ use the setup tool by typing `make setup`
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