FROM tobegit3hub/gitbook-server:latest
MAINTAINER mrcuijing@gmail.com

COPY src /gitbook
WORKDIR /gitbook

RUN gitbook install
RUN gitbook build

EXPOSE 4000

CMD ["gitbook", "serve", "/gitbook"]
