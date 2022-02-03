# Simple Client App

This simple app is written in Python and will make GQL queries to your Graph.

## Prereqs

 1. pip3 install -r requirements.txt
 2. Edit client.py and put in your actual GraphQL Gateway URL.
 3. Edit the client names and versions as you like.
 4. Edit the query list to use queries that are compatible with your graph.

 ## Run

Run with hard-coded gateway URL:
`python3 client.py`

Run with gateway URL as argument:
`python 3 client.py <gateway-url>`

You can also specify via the environment variable `GATEWAY_URL`.

## Deploy to Cloud Functions

This will start sending traffic to your deployed graph.  Make sure you edit client.py first to set the URL
of your gateway.

`make deploy`

## Setup Cloud Functions - One Time Only

`make setup-traffic-gen`