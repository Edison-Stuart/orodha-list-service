FROM edisonstuart/orodha-base-image-prod:latest

ARG SERVER_USER=gunicorn-user
ARG PORT=5000

RUN adduser ${SERVER_USER} -G www-data -D
USER ${SERVER_USER}

COPY ./application /orodha-list-service/application
COPY ./scripts/server_scripts/server_start.sh /orodha-list-service

WORKDIR /orodha-list-service

CMD /orodha-list-service/server_start.sh  -u ${SERVER_USER} -p ${PORT}
