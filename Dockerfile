FROM ubuntu
MAINTAINER Adam Hert

RUN     apt-get update && apt-get install -y nodejs && \
        apt-get install -y nodejs-legacy && \
        apt-get install -y wget && \
        wget https://files.appneta.com/install_appneta.sh && \
        sh ./install_appneta.sh <Traceview site key> && \
        mkdir /var/node && \
        apt-get install -y npm && \
        npm install --save -y --prefix /var/node traceview && \
	apt-get install -y supervisor

ADD server.js /var/node/server.js 
ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
