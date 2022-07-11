FROM registry.fedoraproject.org/fedora-minimal:35

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install python3-pip && \
    microdnf --nodocs -y reinstall tzdata && \
    microdnf clean all
