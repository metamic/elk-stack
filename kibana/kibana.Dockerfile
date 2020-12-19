ARG VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/kibana/kibana:${VERSION}

# Add plugin here for kibana