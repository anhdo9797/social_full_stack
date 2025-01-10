# Use the official Node.js image as the base image
FROM node:23

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 8081

# Define environment variables
ENV PORT=8081
ENV MONGO_URI=mongodb://localhost:27017

# Start the application
CMD ["npm", "run", "dev"]