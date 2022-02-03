from client import run_client

def traffic_generator(event, context):
    run_client()
    return ""