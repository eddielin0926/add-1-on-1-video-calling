FROM node:20 as build

ARG API_URI
ARG ROLE

WORKDIR /usr/src/app

# Install dependencies first, as they change less often than code.
COPY package.json package-lock.json* ./
RUN npm ci && npm cache clean --force

ENV API_URI=${API_URI}
ENV ROLE=${ROLE}

COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80