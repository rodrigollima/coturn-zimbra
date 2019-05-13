Coturn TURN server for Zimbra Talk Users
========================================

## What is Coturn TURN server?

The TURN Server is a VoIP media traffic NAT traversal server and gateway. It can be used with Zimbra Talk V2.

> [github.com/coturn/coturn](https://github.com/coturn/coturn)


## How to use this image

To run Coturn TURN server just start the container: 
```bash
git clone https://github.com/rodrigollima/coturn-zimbra.git
cd coturn-zimbra

vim etc/turnserver.conf 

change external-ip: public-ip/local-ip
external-ip=3.89.237.31/10.0.1.28

change user: username:password
user=ninefingers:youhavetoberealistic

docker build -t coturn-zimbra .
docker run -v /var/log:/var/log -p 3478:3478 -p 3479:3479 -p 3478:3478/udp -p 3479:3479/udp -p 1000-1500:1000-1500/udp -d coturn-zimbra
```

## How to use in Zimbra
```bash
su - zimbra
zxsuite talk iceServer add turn:<TURN SERVER PUBLIC IP>:3478?transport=udp credential youhavetoberealistic username ninefingers
```

### Why so many ports opened?

As per [RFC 5766 Section 6.2], these are the ports that the TURN server will use to exchange media.



