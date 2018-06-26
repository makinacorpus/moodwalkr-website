build:
	docker build -t moodwalkr/website:$(tag) -f docker/Dockerfile .
stop:
	docker stop moodwalkr-website
rm: stop
	docker rm moodwalkr-website

production: rm
	docker run --restart always -d --name moodwalkr-website --network proxy \
	-l traefik.backend=moodwalkr-website \
	-l traefik.port=80 \
	-l traefik.frontend.rule="Host:moodwalkr.com,www.moodwalkr.com;PathPrefix:/jekyll-assets/,/fr/apropos/,/en/about/,/es/acerca-de/" \
	moodwalkr/website:$(tag)

deploy: build production
	true
