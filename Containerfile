FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is intended for use with the distrobox command" \
      summary="Arjun's terminal workspace container" \
      maintainer="relay-git-1LKQ1GqLp0Nn4@aspatel.com"

# Install packages Distrobox adds automatically, this speeds up first launch
RUN pacman -S \
        bash-completion \
        bc \
        curl \
        diffutils \
        findutils \
        glibc \
        gnupg \
        inetutils \
        keyutils \
        less \
        lsof \
        man-db \
        man-pages \
        mlocate \
        mtr \
        ncurses \
        nss-mdns \
        openssh \
        pigz \
        pinentry \
        procps-ng \
        rsync \
        shadow \
        sudo \
        tcpdump \
        time \
        traceroute \
        tree \
        tzdata \
        unzip \
        util-linux \
        util-linux-libs \
        vte-common \
        wget \
        words \
        xorg-xauth \
        zip \
        mesa \
        opengl-driver \
        vulkan-intel \
        vte-common \
        vulkan-radeon \
        --noconfirm

# `distrobox-host-exec` will detect that it has been symlinked to
# and it will execute the linking program on the host machine.
RUN \
    ln -fs /bin/sh /usr/bin/sh && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
