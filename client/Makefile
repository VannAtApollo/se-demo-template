check:
	apollo client:check --includes="*.py"

check-contract:
	apollo client:check --includes="*.py" --variant internal-api

deploy:
	gcloud builds submit

setup-traffic-gen:
	gcloud pubsub topics create traffic_gen || true
	gcloud scheduler jobs create pubsub traffic-gen  --schedule "*/5 * * * *" --topic traffic_gen --message-body "Hello"