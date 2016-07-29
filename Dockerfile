FROM cbrandlehner/homebridge:0.16
#FROM nodesource/jessie:5.8.0
MAINTAINER Nick Artman <nick@addosolutions.com>

##################################################
# Set environment variables                      #
##################################################

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN npm install -g homebridge-smartthings --unsafe-perm

##################################################
# Start                                          #
##################################################

USER root
RUN mkdir -p /var/run/dbus

ADD image/run.sh /root/run.sh

EXPOSE 5353 51826
CMD ["/root/run.sh"]
