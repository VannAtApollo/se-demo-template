install-deps:
	cd client && pip3 install -r requirements.txt || echo "!!! Unable to install Python libaries. !!!"
	cd client && cp -n dot_env .env || true
	cd gateway && npm install && cp -n dot_env .env || cp -n cloudbuild.yaml.tmpl cloudbuild.yaml || true
	cd subgraph1 && npm install && cp -n dot_env .env || cp -n cloudbuild.yaml.tmpl cloudbuild.yaml || true
	cd subgraph2 && npm install && cp -n dot_env .env || cp -n cloudbuild.yaml.tmpl cloudbuild.yaml || true
	cd subgraph3 && npm install && cp -n dot_env .env || cp -n cloudbuild.yaml.tmpl cloudbuild.yaml || true

setup:
	python3 setup.py

supergraph:
	rover supergraph compose --config supergraph.yaml > gateway/supergraph.graphql

run-local-unmanaged: supergraph
	docker build -f gateway/Dockerfile.unmanaged gateway -t gateway-unmanaged
	docker build -f subgraph1/Dockerfile subgraph1 -t subgraph1
	docker build -f subgraph2/Dockerfile subgraph2 -t subgraph2
	docker build -f subgraph3/Dockerfile subgraph3 -t subgraph3
	docker-compose -f local-test-unmanaged.yaml up 

run-local-managed:
	docker build -f gateway/Dockerfile gateway -t gateway
	docker build -f subgraph1/Dockerfile subgraph1 -t subgraph1
	docker build -f subgraph2/Dockerfile subgraph2 -t subgraph2
	docker build -f subgraph3/Dockerfile subgraph3 -t subgraph3
	docker-compose --env-file ./gateway/.env -f local-test.yaml up 

deploy:
	cd gateway && make deploy
	cd subgraph1 && make deploy
	cd subgraph2 && make deploy
	cd subgraph3 && make deploy

publish:
	cd subgraph1 && make publish
	cd subgraph2 && make publish
	cd subgraph3 && make publish

