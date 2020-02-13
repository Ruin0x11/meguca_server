FROM node:10

WORKDIR /receptor
EXPOSE 80 \
       3000
ADD . /receptor
RUN npm install

CMD ["npm", "start"]
