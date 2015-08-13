#Usage
This docker provides the flower GUI for the celery workflow system, based on a redis broker.

The redis broker settings can be set via environment variables:

	REDIS_HOST: Defaults to 'redis', so in case of docker linking this will work out of the box
	REDIS_PORT: Defaults to 6379
	REDIS_DATABASE: Defaults to 0

Example with linking:

	docker run -d --name flower --link redis:redis placr/flower
	
Example with redis running on 'another.host' (linking will not work across hosts):

	docker run -d --name flower -e REDIS_HOST=another.host placr/flower