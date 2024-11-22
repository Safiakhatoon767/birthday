# Use a base image with Node.js and Python
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Install Python if not already available in the image
RUN apt-get update && apt-get install -y python3

# Copy package.json and install dependencies
COPY package*.json /app/
RUN npm install

# Copy the current directory contents into the container
COPY . /app

# Expose port 8081 for the web server
EXPOSE 8081

# Default command to run the server using either Python or Node.js
CMD ["bash", "-c", "if command -v python3 &> /dev/null; then python3 -m http.server 8081; else npm run server-node; fi"]

