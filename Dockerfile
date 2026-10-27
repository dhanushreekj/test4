#STAGE 1 : Build 
FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ..

#STAGE 2 : Running
FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
CMD ["node","index.js"]
