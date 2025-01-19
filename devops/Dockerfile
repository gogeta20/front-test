FROM node:18
RUN npm install -g npm vite
WORKDIR /app

COPY project/package.json ./
RUN npm install
COPY project/ .

EXPOSE 5180
CMD ["npm", "run", "dev"]
