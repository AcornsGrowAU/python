ARG ROCKY_VERSION=10
FROM rockylinux/rockylinux:${ROCKY_VERSION}-minimal AS base

ARG PYTHON_VERSION=3.12

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install python${PYTHON_VERSION}-pip && \
    microdnf --nodocs -y reinstall tzdata && \
    microdnf clean all

ONBUILD ARG UID=1000
ONBUILD RUN useradd -d /python -l -m -Uu ${UID} -s /bin/bash python && \
    chown -R ${UID}:${UID} /python

