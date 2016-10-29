start_docker:
	bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
run: bind_x11
	docker run --rm -it -e DISPLAY=192.168.99.1:0 -v $(shell pwd):/environment/development $(image)
bind_x11:
	socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$(DISPLAY)\" &
publish:
	docker tag $(image):$(tag) 842902045740.dkr.ecr.us-east-1.amazonaws.com/$(image):$(tag)
	docker push 842902045740.dkr.ecr.us-east-1.amazonaws.com/$(image):$(tag)
pull:
	docker pull 842902045740.dkr.ecr.us-east-1.amazonaws.com/$(image):$(tag)
	docker tag 842902045740.dkr.ecr.us-east-1.amazonaws.com/$(image):$(tag) $(image):$(tag) 
