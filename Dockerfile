# Use an official Node.js runtime as the base image
FROM node:21-alpine3.17

# Install build dependencies
RUN apk add --no-cache python3 make g++

# Create and set the working directory in the container
WORKDIR /FileGuardianBot

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your project files to the container
COPY . .

# Copy the .env file to the container
COPY .env .env

# Command to start your Node.js application
CMD ["npm", "run", "start"]
