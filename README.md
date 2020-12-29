# README

This is a self-build container setup to run Jupyterhub behind a reverse
https proxy. It was mostly done to learn more about container orchestration and
how to use it in a private network. As no detailed configuration was done, it
is not advised to use this setup in any productive environment.

Nginx is used as the reverse proxy for https support and its config can
be accessed and changed in `proxy/nginx.conf`. The ssl certificate is provided
with the docker container `paulczar/omgwtfssl`. The environment variables for
the certificate and Jupyterhub can be changed in `.env`.

## Usage

### Quickstart

#### Start all Services

```shell script
docker-compose up -d
```

After a successful run Jupyterhub can be accessed on `https://<ip-of-your-machine>:10444`.

#### Create a User

```shell script
./scripts/create_user.sh <username> <password>
```

#### Stop all Services

```shell script
docker-compose down
```

### Using Host System User Management (Fedora and CentOS)

> This implies a security risk and should be used with care!

```shell script
docker-compose -f docker-compose.yml -f docker-compose.fedora.yml up -d
```

Juoyterhub will use the `/home` directory of the host as its `/home` directory and also use the `/etc/passwd`,
`/etc/group`, `/etc/shadow`, `/etc/gshadow`, `/etc/pamd.d`, and `/etc/authselect/` from the host machine. Which means
that the Jupyterhub admin group (`jupyterhub-admins`) must exist on the host, even if no user is a member of the group.
