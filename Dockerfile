FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

USER node

RUN mkdir -p DNportal
RUN mkdir -p messanger

COPY --chown=node:node ./master ./DNportal
COPY ./messanger ./messanger
COPY ./dnportal-docker/wrapper-script.sh .

RUN cd DNportal && npm install && cd .. && cd messanger && npm install

EXPOSE 8000
EXPOSE 8001

CMD "./wrapper-script.sh"
