FROM node:latest
MAINTAINER mrcuijing@gmail.com

# Install latest version
RUN npm install -g gitbook-cli
RUN gitbook install 2.2.0

COPY src /gitbook
WORKDIR /gitbook

RUN gitbook build

EXPOSE 4000

CMD ["gitbook", "serve", "/gitbook"]
