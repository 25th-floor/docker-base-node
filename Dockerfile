FROM node:5

MAINTAINER 25th-floor GmbH "operations@25th-floor.com"
EXPOSE "8080"
WORKDIR /app

# Ctrl-C support for container
# F*** npm
RUN npm install npm-start -g
RUN sed -i 's/\(.\+\)\(trap on_proxy_exit \)SIGTERM/&\n\1\2SIGINT/' /usr/local/bin/npm-start

# Install our entrypoint script
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
CMD ["run"]

# Install production dependencies
ONBUILD ENV NODE_ENV production
ONBUILD ADD ./package.json /app/
ONBUILD RUN npm install

# Install application
ONBUILD COPY . /app
