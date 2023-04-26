# workspace

Container image for my development workspace.

## Usage

This image is meant to be used with the `distrobox` command. (You can also use it with `toolbox`.)

Copy the Distrobox manifest file to the root of your `$HOME` directory.

```bash
cp --verbose --update ./distrobox.ini ~/distrobox.ini
```

Then, use the below command to create the workspace container.

```bash
distrobox assemble create
```

When you're done, you can use this command to destroy the workspace container.

```bash
distrobox assemble rm
```

## Attribution

This project is derived from [boxkit](https://github.com/ublue-os/boxkit).
