# workspace

Container image for my dev workspace.

## Usage

Run

```bash
podman pull ghcr.io/apatel762/workspace:latest  # optional
toolbox create --image ghcr.io/apatel762/workspace workspace
```

To cleanup

```bash
toolbox rm --force workspace
```

## Verification

These images are signed with Sigstore's [`cosign`](https://docs.sigstore.dev/cosign/overview/). Verify the signature by downloading the `cosign.pub` key from this repo, and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/apatel762/workspace
```
