FROM alpine:latest

# Update apk packages
RUN apk update && apk upgrade

# Add git npm yarn aws-cli
RUN apk add --no-cache --update git
RUN apk add --no-cache --update npm
RUN apk add --no-cache --update yarn
RUN apk add --no-cache --update aws-cli

# Add OpenTofu cli
RUN apk add opentofu --repository=https://dl-cdn.alpinelinux.org/alpine/latest-stable/main

# Install serverless framework cli
RUN npm install -g serverless@3.39.0

# Install golang binary
COPY --from=golang:1.23-alpine3.20 /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

# Setup private go if necessary
RUN go env -w GOPRIVATE=$GOPRIVATE

ENTRYPOINT []
# ENTRYPOINT ["/bin/sh"] # For interactive mode