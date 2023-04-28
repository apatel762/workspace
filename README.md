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

## Extras

Change the `Exec` line in the `.desktop` file in `~/.local/share/applications` so that you always enter your custom home directory, instead of ending up in the host home directory.

```ini
[Desktop Entry]
Name=Workspace
GenericName=Terminal entering Workspace
Comment=Terminal entering Workspace
Categories=Distrobox;System;Utility
Exec=/var/home/apatel/.local/bin/distrobox enter Workspace --no-workdir
Icon=/var/home/apatel/.local/share/icons/distrobox/alpine.png
Keywords=distrobox;
NoDisplay=false
Terminal=true
TryExec=/var/home/apatel/.local/bin/distrobox
Type=Application
```

(The `--no-workdir` parameter is what you've got to add.)

And then update the desktop entry database using:

```bash
update-desktop-database ~/.local/share/applications
```

## Attribution

This project is derived from [boxkit](https://github.com/ublue-os/boxkit).
