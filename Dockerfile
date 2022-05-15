FROM cypress/base:16.13.0

WORKDIR /usr/src/app

COPY . .

RUN npm install

EXPOSE 3000

ENTRYPOINT "/usr/src/app/start.sh"
