# Base image is node-version 18.17.1
FROM node:18.17.1
# update OS and install lsb-release
RUN apt-get update \
    && apt-get install -y lsb-release
# install nano, release and clean all installation files
RUN apt-get install -y nano \
    && apt-get install -y bash \
    && apt-get clean
# create directory backend and ...
RUN mkdir /backend
# set it as working directory
WORKDIR /server
# copy all local files in the backend into
# working directory
COPY backend/* .
# install all nodejs dependencies
RUN npm install
# expose port 3000 of the app
EXPOSE 3000
# run backend
CMD ["npm", "run", "server"]

