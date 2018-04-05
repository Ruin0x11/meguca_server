# site
Static site generated from markdown.

Automatically recompiles when a change to `site/md` is detected on the host.

## Usage
```yaml
version: '3'
services:
    site:
        build: ./site
        user: "1000" # UID of user owning the site dir
        volumes:
            - /var/www/meguca.moe:/data/site # Site markdown repo
            - /etc/group:/etc/group:ro       # for inotify to work
            - /etc/passwd:/etc/passwd:ro     # for inotify to work
```

The `/etc/group` and `/etc/passwd` mounts allow inotify changes to be detected across the host to the container.
