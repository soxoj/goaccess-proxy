# Goaccess-proxy

## Fast start

1. Run container
	docker build . -t goproxy && docker run -it -p8080:80 goproxy

2. Test request
	curl http://localhost:8080/