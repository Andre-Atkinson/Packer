# packer
Hashicorp Packer files to create an ubuntu 2004 VMware template.

ISO can be found at https://old-releases.ubuntu.com/releases/20.04/ubuntu-20.04.1-live-server-amd64.iso <br />
```
Git clone https://github.com/Andre-Atkinson/packer.git
cd ubuntu2004
```
Edit the vmwarevars.auto.pkrvars.hcl file with your details. <br />
Add your SSH key to the user-data file under authorized keys <br />
```
packer init .
packer build .
```
