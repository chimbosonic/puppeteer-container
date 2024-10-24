
test: build-test run-test cleanup

build-test:
	docker compose -f docker-compose.integration-tests.yml build tests

run-test:
	docker compose -f docker-compose.integration-tests.yml run tests

run-bash:
	docker compose -f docker-compose.integration-tests.yml run tests /bin/bash
	
cleanup:
	docker compose -f docker-compose.integration-tests.yml down --rmi all -v