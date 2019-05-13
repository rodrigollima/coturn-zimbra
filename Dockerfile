FROM centos:7

MAINTAINER Rodrigo Lima <rodrigo.lima@inova.net>

ADD ./start_coturn.sh start_coturn.sh
ADD ./package/libevent-2.0.21-stable.tar.gz .
ADD ./package/turnserver-3.2.4.2.tar.gz .
ADD ./etc/turnserver.conf /etc/

RUN yum -y update && yum install -y make gcc cc gcc-c++ wget openssl-devel libevent libevent-devel mysql-devel mysql-server
RUN cd libevent-2.0.21-stable && ./configure && make && make install && cd ..
RUN cd turnserver-3.2.4.2 && ./configure && make && make install && cd ..


# STUN/TURN UDP
EXPOSE 3478/udp
# STUN/TURN TCP
EXPOSE 3478/tcp
# STUN/TURN UDP Alt port (RFC5780 support)
EXPOSE 3479/udp
# STUN/TURN TCP Alt port (RFC5780 support)
EXPOSE 3479/tcp
# STUN/TURN DTLS
EXPOSE 5349/udp
# STUN/TURN TLS
EXPOSE 5349/tcp
# STUN/TURN DTLS Alt port (RFC5780 support)
EXPOSE 5350/udp
# STUN/TURN TLS Alt port (RFC5780 support)
EXPOSE 5350/tcp
# UDP media ports for TURN relay
EXPOSE 1500-2000/udp

RUN chmod +x start_coturn.sh

CMD ["./start_coturn.sh"]


