import random, sys, os

from gql import gql, Client
from gql.transport.requests import RequestsHTTPTransport

HOST_NAME = "CHANGE_ME_TO_GATEWAY_URL"

def run_client():
    client_name = [
        "iOS",
        "web",
        "Android",
    ]

    versions = ['1.0', '1.1', '1.2']

    host = HOST_NAME
    if len(sys.argv) > 1:
        host = sys.argv[1]
    host = os.environ.get("GATEWAY_URL", host)

    # Select your transport with a defined url endpoint
    transport = RequestsHTTPTransport(
        url=host, 
        headers={
            'apollographql-client-name': random.choice(client_name),
            'apollographql-client-version': random.choice(versions)
        }, verify=True, retries=3,
    )
    # Create a GraphQL client using the defined transport
    client = Client(transport=transport, fetch_schema_from_transport=False)

    queries = [
    gql("query getAwards { awards { awardTitle, awardName, year }}"),
    gql("query getAwardName { awards { awardName }}"),
    gql("query getAwardDetails { awards { awardName, title }}"),
    gql("query getAuthors { authors { name, yearBorn, biography }}"),
    gql("query getBooks { books { title, isbn, author, publisher }}"),
    gql("query getAuthorsDetail { authors { name, books { title }, awards { awardName } }}"),
    gql("query getHomePageDetail { authors { name, books { title }, awards { awardName } }, books { title }, awards { awardName, title } }"),
    ]

    for i in range(random.randint(50,100)):
        # Provide a GraphQL query
        query = random.choice(queries)
        # Execute the query on the transport
        result = client.execute(query)

if __name__=="__main__":
    run_client()