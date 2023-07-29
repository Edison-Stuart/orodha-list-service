FROM python:3.11.4-slim-bookworm

ARG SERVER_USER=gunicorn-user
ARG REQUIREMENTS_FILE=requirements.txt
ARG PORT=5000
COPY ./${REQUIREMENTS_FILE} .

RUN apt-get update -y && \
	DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC && \
	apt-get install -y python3-pip python3-dev && \
	useradd ${SERVER_USER} && \
	usermod -aG www-data ${SERVER_USER} && \
	pip install -r ${REQUIREMENTS_FILE} && \
	rm ${REQUIREMENTS_FILE}

COPY ./application /orodha-list-service/application
COPY ./scripts/server_scripts/server_start.sh /orodha-list-service
RUN chmod +x /orodha-list-service/server_start.sh 

WORKDIR /orodha-list-service

CMD /orodha-list-service/server_start.sh  -u ${SERVER_USER} -p ${PORT}
