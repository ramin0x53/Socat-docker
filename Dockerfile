FROM alpine:3.16

RUN apk add --update --no-cache \
		socat \
	&& echo "Removing apk cache" \
	&& rm -rf /var/cache/apk/

CMD socat tcp-listen:$LOCAL_PORT,reuseaddr,fork tcp:$REMOTE_HOST:$REMOTE_PORT ; socat UDP4-RECVFROM:$LOCAL_PORT,fork UDP4-SENDTO:$REMOTE_HOST:$REMOTE_PORT
