build:
ifdef version
	docker build . -t randyhermawan/deploy-master-a:$(version)
else
	echo "no image version given"
endif

push:
ifdef version
	docker push randyhermawan/deploy-master-a:$(version)
else
	echo "no image version given"
endif

buildpush: 
ifdef version
	docker build . -t randyhermawan/deploy-master-a:$(version)
	docker push randyhermawan/deploy-master-a:$(version)
else
	echo "no image version given"
endif