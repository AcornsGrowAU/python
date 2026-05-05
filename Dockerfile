ARG ROCKY_VERSION=9
FROM rockylinux:${ROCKY_VERSION}-minimal

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install \
    python3 \
    python3-pip && \
    microdnf --nodocs -y reinstall tzdata && \
    microdnf clean all
