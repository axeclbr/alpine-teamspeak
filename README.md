# docker-teamspeak

TS3-Server in Docker

## Usage

Create Datacontainer:

    $ docker create -v /data --name ts3_data axeclbr/data /bin/true
    $ docker run --rm -it --volumes-from ts3_data axeclbr/workbench
    # Inside Container do:
    $ touch /data/ts3server.sqlitedb
    $ chmod -R 503:503 /data
    $ exit

Run:

    docker run -d --net=host --name ts3 \
    --volumes-from ts3_data \
    axeclbr/teamspeak \
    logpath=/data/logs/ \
    query_ip_whitelist=/data/query_ip_whitelist.txt \
    query_ip_blacklist=/data/query_ip_blacklist.txt

To get the server admin query login/pass and admin token for the first client connection:

    docker logs -f ts3

