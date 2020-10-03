docker run --name bind -d --restart=always \ 
--publish 53:53/tcp --publish 53:53/udp --publish 10000:10000/tcp \ 
--volume /srv/docker/bind:/data \ 
sameersbn/bind:9.9.5-20170129
