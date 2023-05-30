ARG FEDORA_VERSION=38

FROM registry.fedoraproject.org/fedora-toolbox:${FEDORA_VERSION}

LABEL com.github.containers.toolbox="true" \
      usage="This image is meant to be used with the toolbox or distrobox command" \
      summary="Arjun's terminal workspace container" \
      maintainer="relay-git-1LKQ1GqLp0Nn4@aspatel.com"

ARG FEDORA_VERSION
ARG RPM_FUSION_FREE=https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm
ARG RPM_FUSION_NONFREE=https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm

# Add RPM Fusion repos
RUN dnf install -y ${RPM_FUSION_FREE} \
    && dnf install -y ${RPM_FUSION_NONFREE}

RUN dnf install -y \
    "@Development Tools" \
    pandoc \
    openssl \
    openssl1.1-devel.x86_64 \
    java \
    python \
    pip \
    pipx \
    sshpass \
    android-tools \
    ffmpeg \
    p7zip \
    borgbackup \
    pinentry \
    pinentry-gnome3 \
    tmux \
    rpmdevtools \
    rpmlint \
    g++ \
    go \
    qrencode

# Add the custom repo for VSCode and install it
# https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
COPY repos/vscode.repo /etc/yum.repos.d/
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc \
    && dnf check-update || true \
    && dnf install -y code

RUN \
    ln -fs /bin/sh /usr/bin/sh && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
