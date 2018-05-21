# Dockerfile for caso accounting EGI/EOSC

Dockerfile with caso to get accounting records from openstack to publish in EGI

## Howto deploy and run

Clone this repo:
```
git clone https://github.com/mariojmdavid/docker-caso.git
```

Go to the scripts directory:
```
cd docker-caso/scripts/
```

Copy sample config files and adjust them to your needs:
```
cp caso.conf.sample caso.conf
cp sender.cfg.sample sender.cfg
cp voms.json.sample voms.json
```

Check if the cron scripts are ok and, execute the script ```deploy.sh```.
It will copy run scripts to ```/usr/local/bin```, will copy the cron scripts
to ```/etc/cron.d```, it will pull the docker image.

It assumes the CA root certificate is ```/etc/certs/caroot.pem``` and that
the cert and key for the server are ```/etc/grid-security/apelcert.pem``` and
```/etc/grid-security/apelkey.pem``` respectivelly

Check the scripts for more details.

