.PHONY: clean

docker-compose.yml: docker-compose-template.yml stack-config.toml
	docker run -i --rm --pull=always \
		-v ${PWD}/stack-config.toml:/usr/src/stack-config.toml:ro \
		hairyhenderson/gomplate:stable \
		--context stackConfig=/usr/src/stack-config.toml \
		< $< \
		> $@

clean:
	rm -f docker-compose.yml
