FROM node:18-alpine
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
COPY .env.example .env
RUN yarn build
EXPOSE 5000
RUN ["chmod", "+x", "./entrypoint.sh"]
ENTRYPOINT [ "sh","./entrypoint.sh" ]