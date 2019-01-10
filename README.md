# pretix-deployement

!This is in pre?-alpha stage!

This repository contains the glue to setup [Pretix](https://pretix.eu) on
[CoreOS](https://coreos.com/) using [Ignition](https://coreos.com/ignition/docs/latest/).

It loosely follows [this Guide](https://docs.pretix.eu/en/latest/admin/installation/docker_smallscale.html).

However it uses [traefik](https://traefik.io/) instead of nginx as reverse proxy,
as it integrates well with Docker and automates generation of signed X509 via
Let's Encrypt quite nicely.

TODO: Create systemd timer to call cronjob

## Usage

Generate the ingition config. This requires docker to be usable locally:

```
cd ignition
make config
```

Spawn a machine. This example assumes Digital Ocean:

```
doctl compute droplet create pretix.example.com \
    --size s-1vcpu-1gb \
    --region fra1 \
    --image coreos-stable \
    --ssh-keys your-key-id \
    --user-data-file config.json
```

You need to ensure that `pretix.example.com` resolves to the IP of the machine
you just started.

Login is possible at `/control/` using `admin@localhost` and `admin` as credentials.
