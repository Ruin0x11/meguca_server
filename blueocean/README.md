# blueocean
Jenkins server with docker capability.

Pushes containers to a docker container running a registry, linked via `docker-compose` as `registry`.

## Usage
```yaml
version: '3'
services:
    registry:
      image: registry:2
      restart: always
      volumes:
          - "/var/lib/registry:/var/lib/registry"
      ports:
        - "5000:5000"

    jenkins:
        build: ./blueocean
        depends_on:
            - registry
        user: "1001" # UID of jenkins user
        expose:
            - "8080"
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock
            - /var/lib/jenkins:/var/jenkins_home # Owned by jenkins user
        environment:
            - VIRTUAL_HOST=aoiumi.meguca.moe
            - VIRTUAL_PORT=8080
```
