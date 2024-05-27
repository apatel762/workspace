ARG FEDORA_VERSION=40

FROM registry.fedoraproject.org/fedora-toolbox:${FEDORA_VERSION}

LABEL com.github.containers.toolbox="true" \
      usage="This image is intended for use with the toolbox command" \
      summary="Arjun's terminal workspace container" \
      maintainer="relay-git-1LKQ1GqLp0Nn4@aspatel.com"

ARG FEDORA_VERSION
ARG RPM_FUSION_FREE=https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm
ARG RPM_FUSION_NONFREE=https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-${FEDORA_VERSION}.noarch.rpm


# Add RPM Fusion repos
RUN dnf install -y ${RPM_FUSION_FREE} \
    && dnf install -y ${RPM_FUSION_NONFREE}


# Install stuff that I actively use
RUN dnf install -y \
    "@Development Tools" \
    fish \
    python \
    pip \
    pinentry \
    pinentry-gnome3 \
    neovim \
    zoxide \
    fzf \
    lsd \
    ranger \
    bat

# Install stuff that I rarely use
RUN dnf install -y \
    pandoc \
    openssl \
    java \
    pipx \
    sshpass \
    ffmpeg \
    p7zip \
    borgbackup \
    tmux \
    qrencode \
    jq

# Delete stuff that I don't want to have
RUN dnf remove -y \
    dconf

# Install `chezmoi` (necessary for config management)
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/bin

COPY usr /usr

# `distrobox-host-exec` will detect that it has been symlinked to
# and it will execute the linking program on the host machine.
RUN \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/keepassxc-cli && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/xdg-open && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/notify-send && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/dconf
