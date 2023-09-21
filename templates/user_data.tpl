#cloud-config
# vim: syntax=yaml
hostname: ${host_name}
manage_etc_hosts: true
users:
  - name: microcloud
    sudo: ALL=(ALL) NOPASSWD:ALL
    ssh_authorized_keys:
      - ${auth_key}
  - name: cloud
    lock_passwd: False
    sudo: ["ALL=(ALL) NOPASSWD:ALL\nDefaults:cloud !requiretty"]
    shell: /bin/bash
ssh_pwauth: true
disable_root: false
chpasswd:
  list: |
    microcloud:linux
  expire: false
growpart:
  mode: auto
  devices: ['/']
write_files:
  - content: |
        #!/bin/sh

runcmd:
  - echo 'Done'
