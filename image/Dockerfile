FROM alpine:edge
MAINTAINER Nick Gasparovich <nick@gasponet.com>

ADD . /build_scripts

RUN /build_scripts/prepare.sh && \
	/build_scripts/utilities.sh && \
	/build_scripts/cleanup.sh
