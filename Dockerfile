# Use the official Node.js image as the base image
FROM timbru31/java-node
# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the files to the container
COPY . .

# Use Selenium Standalone, Chrome and chromedriver
RUN npm install selenium-standalone@latest -g
RUN selenium-standalone install

# Expose the port for Selenium
EXPOSE 4444

# Run Selenium Standalone
CMD ["selenium-standalone", "start"]
CMD ["npm run test"]
