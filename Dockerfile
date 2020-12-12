ARG GOLANG_CROSS_VERSION=1.13.15
FROM dockercore/golang-cross:${GOLANG_CROSS_VERSION}

LABEL maintainer="robdefeo@gmail.com"

ARG GORELEASER_VERSION=0.127.0
ARG GORELEASER_SHA=bf7e0f34d1d46041f302a0dd773a5c70ff7476c147d3a30659a5a11e823bccbd

ARG GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ARG GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

RUN  wget ${GORELEASER_DOWNLOAD_URL}; \
			echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser; \
			rm $GORELEASER_DOWNLOAD_FILE;

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \ 
 	add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && \
	apt-get install -y docker-ce \
	docker-ce-cli

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-h"]

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
