FROM node:18-bullseye

WORKDIR /app

# Install dependencies for native modules
RUN apt-get update && apt-get install -y python3 make g++ && rm -rf /var/lib/apt/lists/*

COPY package*.json ./

RUN npm ci || npm install --legacy-peer-deps

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
