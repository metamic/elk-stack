ARG VERSION

# https://www.docker.elastic.co/
FROM docker.elastic.co/logstash/logstash:${VERSION}

# Add plugin here
# Example: RUN logstash-plugin install logstash-filter-json
