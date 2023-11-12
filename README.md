# microcloud

## Preparations

```shell
cd ~/repos/microcloud

mkdir -p sources templates volumes ssh
```

```shell
wget -O sources/ubuntu.qcow2 https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qemu-img resize sources/ubuntu.qcow2 150G
```

```shell
ssh-keygen -t rsa -b 4096 -f $HOME/.ssh/id_rsa -N ""
ln -s $HOME/.ssh/id_rsa.pub $HOME/repos/microcloud/ssh/
```

```virsh
pool-define-as --name microcloud --type dir --target ~/repos/microcloud/volumes
pool-autostart microcloud
pool-start microcloud
```

```shell
terraform init
terraform apply
```

```shell
ssh microcloud@192.168.122.11
```

```shell
ssh -t microcloud@192.168.122.11 bash -l
```

```shell
sudo snap install openstack --channel 2023.1
sunbeam prepare-node-script | bash -x && newgrp snap_daemon
sunbeam cluster bootstrap --accept-defaults
sunbeam configure --accept-defaults --openrc demo-openrc
sunbeam openrc > admin-openrc
```

```shell
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "192.168.122.11"
```
