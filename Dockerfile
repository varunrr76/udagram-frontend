FROM beevelop/ionic AS ionicApp

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN ionic build

FROM nginx:alpine
COPY --from=ionicApp /usr/src/app/www /usr/share/nginx/html