# Use the official Node.js runtime as a parent image
FROM node:16

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install production dependencies
RUN npm install --production

RUN npm install -g typescript

#build the app for production with minification
RUN npm run build:production

# Copy the rest of the application code to the container
COPY . .

# Expose the port used by the server
EXPOSE 3000

# Set the environment variables
ENV NODE_ENV=production
ENV PORT=3000

# Start the server
CMD [ "npm", "dist/server.js" ]