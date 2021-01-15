FROM node:alpine

RUN npm install -g @aws-amplify/cli

WORKDIR /opt/node/app/src