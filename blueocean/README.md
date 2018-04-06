# blueocean
Jenkins server with docker capability.

Pushes containers to a docker container running a registry, linked via `docker-compose` as `registry`.

## Setup
Run `provision_jenkins.yml` in the repo root as an Ansible playbook. Copy the pubkey it generates into the GitHub profile settings.

Run `raise.yml` to create the initial seed job. Edit `raise.yml` to include a list of repositories to dockerize. It assumes the repos each have a `Jenkinsfile`.

## Troubleshooting

### Host key verification failed.
Add github.com/bitbucket.org to `/var/lib/jenkins/.ssh/known_hosts`.

```
ssh-keyscan -t rsa github.com bitbucket.org > /var/lib/jenkins/.ssh/known_hosts`
```

Also make sure `id_rsa.pub` was added to GitHub/Bitbucket account settings.
