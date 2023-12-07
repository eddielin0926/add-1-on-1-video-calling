FROM node:20

WORKDIR /usr/src/app

# Install dependencies first, as they change less often than code.
COPY package.json package-lock.json* ./
RUN npm i && npm cache clean --force

COPY . .

CMD [ "npm", "run", "start"]
