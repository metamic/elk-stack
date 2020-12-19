ARG VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/elasticsearch/elasticsearch:${VERSION}

# Add plugin here for eleastic search
# Example: RUN elasticsearch-plugin install analysis-icu