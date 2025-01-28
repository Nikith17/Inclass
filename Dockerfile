# Step 1: Use the node:19.7.0-alpine base image
FROM node:19.7.0-alpine

# Step 2: Set the environment variable NODE_ENV to production
ENV NODE_ENV=production

# Step 3: Create a new directory in root called labone
RUN mkdir /labone && chown node:node /labone

# Step 4: Set the working directory to /labone
WORKDIR /labone

# Step 5: Set the user to node
USER node

# Step 6: Copy all source files and change ownership to node user and group
COPY --chown=node:node . .

# Step 7: Install Node.js dependencies
RUN npm install

# Step 8: Expose port 3000
EXPOSE 3000

# Step 9: Set the default command to run the application
CMD ["node", "src/index.js"]