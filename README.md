# SE Demo Template

Use this template to quickly build and deploy a Federated demo environment.

## Prereqs

 1. Install Docker for Mac
 2. Install Homebrew & Python 3: https://docs.python-guide.org/starting/install3/osx/
 3. Install NVM for Mac: https://tecadmin.net/install-nvm-macos-with-homebrew/ 
 4. Install NodeJS v16.13.1 using NVM: `nvm install v16.13.1`
 5. Use NodeJS v16.13.1: nvm use v16.13.1 
 5. Install the Apollo CLI: https://www.apollographql.com/docs/devtools/cli/
 6. Install the Rover CLI: https://www.apollographql.com/docs/rover/
 7. Log into Studio and create a Deployed Graph, get an API Key and note your Graph ID and Variant ID
 9. Run `make install-deps` to install npm packages for each subgraph and to rename dot_env to .env (this will overwrite current .env files)
 8. Edit the .env file in ./gateway, ./subgraph1, ./subgraph2, ./subgraph3

## Install Dependencies

`make install-deps`

## Run it Locally with Unmanaged Federation (Local Composition)

`make run-local-unmanaged`

## Run it Locally with Managed Federation

`make run-local-managed`

## Deploy everything to GCP