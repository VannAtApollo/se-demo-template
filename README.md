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
 10. Edit the .env file in ./gateway, ./subgraph1, ./subgraph2, ./subgraph3 to full in the appropriate variables

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

`make deploy`


## Files & Directories

 * _.github/_ - configuration for GitHub Actions (CI/CD)
 * _client/_ - a simple client app to send GQL queries to your demo
 * _gateway/_ - the Apollo Gateway for this demo
 * _subgraph1/_ - a subgraph for this demo
 * _subgraph2/_ - a subgraph for this demo
 * _subgraph3/_ - a subgraph for this demo
 * _.gitignore_ - files that git should not manage
 * _local-test-unmanaged.yaml_ - a config file for Docker Compose to run an unmanaged Federation demo
 * _local-test.yaml_ - a config file for Docker Compose to run an managed Federation demo
 * _Makefile_ - a collection of command shortcuts