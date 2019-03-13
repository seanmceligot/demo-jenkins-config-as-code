VOLUMES=
CURRENT_HOST=localhost
MY_PIPELINE_LIBRARY_DIR=plugins
#MY_OTHER_PIPELINE_LIBS_DIRS=plugins

default: run

build:
	mkdir -p plugins
	docker build -t onenashev/demo-jenkins-config-as-code . 2>&1 | tee $@.log

run:
	docker run --rm ${VOLUMES} --name democasc -v maven-repo:/root/.m2 -v ${MY_PIPELINE_LIBRARY_DIR}:/var/jenkins_home/pipeline-library -v ${MY_OTHER_PIPELINE_LIBS_DIRS}:/var/jenkins_home/pipeline-libs -e DEV_HOST=${CURRENT_HOST} -p 8080:8080 -p 50000:50000  onenashev/demo-jenkins-config-as-code 2>&1 | tee $@.log

debug:
	docker run --rm ${VOLUMES} --name democasc -e DEBUG=true -p 5005:5005 -v maven-repo:/root/.m2 -v ${MY_PIPELINE_LIBRARY_DIR}:/var/jenkins_home/pipeline-library -v ${MY_OTHER_PIPELINE_LIBS_DIRS}:/var/jenkins_home/pipeline-libs -e DEV_HOST=${CURRENT_HOST} -p 8080:8080 -p 50000:50000  onenashev/demo-jenkins-config-as-code
