# Use a base image with Node.js pre-installed
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the port on which your Node.js application listens
EXPOSE 5000

# Start the Node.js application by running index.js
CMD ["npm", "start"]

