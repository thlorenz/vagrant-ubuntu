# vagrant ubuntu

Sets up ubuntu inside a VirtualBox and applies my dotfiles, so if you want the exact same setup I'm using, do the below:

- install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- install [vagrant](http://www.vagrantup.com/)
- install [ansible](http://www.ansible.com/home) via `brew install ansible` (only if you want to provision with ansible
  from your mac, below we'll provision the machine from within itself)

```sh
git clone https://github.com/thlorenz/vagrant-ubuntu && cd vagrant-ubuntu
vagrant up
```

Things should set themselves up and when it's done you can:

```sh
vagrant ssh
```

## Setting up via Ansible

We use local ansible setup in order to avoid ssh issues.

Assuming you logged into the box via `vagrant ssh` please do the following:

- `cd /vagrant` into the mounted directory of this repo
- `./apt-install-ansible.sh` to install latest ansible version
- `./ansible-basic.sh` to do the basic install, you can also use the _barebones_ or _all_ version of that script 

## Compatability

I needed to change a bunch of things when upgrading either of the above tools needed, therefore I'm listing the versions
of each with which this worked the last time.

```
➝  vagrant --version
Vagrant 1.8.4

➝  VBoxHeadless --version
Oracle VM VirtualBox Headless Interface 5.0.22
(C) 2008-2016 Oracle Corporation
All rights reserved.

5.0.22r108108

➝  ansible --version
ansible 2.0.2.0
  config file = /Volumes/d/dev/do/vagrant-arch/ansible.cfg
    configured module search path = Default w/o overrides
```

## Note

It assumes you have a nice machine and therefore allocates **1/4 memory** and **all your CPUs** to the box in order to make it
run efficiently.

If that is a problem for you pleas edit the `Vagrantfile` and adapt the `config.vm.provider :virtualbox` section.
