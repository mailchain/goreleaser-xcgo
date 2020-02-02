FROM docker.elastic.co/beats-dev/golang-crossbuild:1.13.7-main
# https://github.com/elastic/golang-crossbuild

LABEL maintainer="robdefeo@gmail.com"

RUN apt-get update -qq && apt-get install -y -q --no-install-recommends \
    wget \
 && rm -rf /var/lib/apt/lists/*

ENV GORELEASER_VERSION=0.123.3
ENV GORELEASER_SHA=cad997014e5c6a462488757087db4145c2ae7d7d73a29cb62bbfd41f18ccea30

ENV GORELEASER_DOWNLOAD_FILE=goreleaser_Linux_x86_64.tar.gz
ENV GORELEASER_DOWNLOAD_URL=https://github.com/goreleaser/goreleaser/releases/download/v${GORELEASER_VERSION}/${GORELEASER_DOWNLOAD_FILE}

RUN  wget ${GORELEASER_DOWNLOAD_URL}; \
			echo "$GORELEASER_SHA $GORELEASER_DOWNLOAD_FILE" | sha256sum -c - || exit 1; \
			tar -xzf $GORELEASER_DOWNLOAD_FILE -C /usr/bin/ goreleaser; \
			rm $GORELEASER_DOWNLOAD_FILE;
			
CMD ["goreleaser", "-v"]
