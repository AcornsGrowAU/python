ARG ROCKY_VERSION=10
FROM rockylinux/rockylinux:${ROCKY_VERSION}-minimal

# Python minor version. Must match a Rocky Linux 10 AppStream package.
ARG PYTHON_VERSION=3.12

RUN microdnf --nodocs -y upgrade && \
    microdnf --nodocs -y install \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-pip && \
    microdnf --nodocs -y reinstall tzdata && \
    ln -sf /usr/bin/python${PYTHON_VERSION} /usr/local/bin/python3 && \
    ln -sf /usr/bin/python${PYTHON_VERSION} /usr/local/bin/python && \
    ln -sf /usr/bin/pip${PYTHON_VERSION} /usr/local/bin/pip3 && \
    ln -sf /usr/bin/pip${PYTHON_VERSION} /usr/local/bin/pip && \
    microdnf clean all
