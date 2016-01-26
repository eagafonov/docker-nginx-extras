FROM debian:jessie

MAINTAINER Eugene Agafonov "e.a.agafonov@gmail.com"

RUN apt-get update \
	&& apt-get install -y ca-certificates nginx-extras \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
