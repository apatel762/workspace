FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="This image is intended for use with the distrobox command" \
      summary="Arjun's terminal workspace container" \
      maintainer="relay-git-1LKQ1GqLp0Nn4@aspatel.com"

# `distrobox-host-exec` will detect that it has been symlinked to
# and it will execute the linking program on the host machine.
RUN \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
