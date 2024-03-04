ARG FEDORA_VERSION
FROM registry.fedoraproject.org/fedora-minimal:${FEDORA_VERSION}

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install \
    gcc \
    postgresql-devel \
    python3-devel \
    python3-pip && \
    microdnf --nodocs -y reinstall tzdata && \
    microdnf clean all && \
    rm -rf /var/cache/*