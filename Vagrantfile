# -*- mode: ruby -*-
# vi: set ft=ruby :


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

IP = '192.168.50.51'

# optional dependencies, these vars are picked
# up inside the ansible roles (see ansible/group_vars)
LLDB     = ENV['LLDB']
CLANG    = ENV['CLANG']
PERF     = ENV['PERF']
DEVEL    = ENV['DEVEL']
DOTFILES = ENV['DOTFILES']
VIM      = ENV['VIM']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  host = RbConfig::CONFIG['host_os']

  # Give VM 1/4 system memory & access to all cpu cores on the host
  if host =~ /darwin/
    cpus = `sysctl -n hw.ncpu`.to_i
    # sysctl returns Bytes and we need to convert to MB
    mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
  elsif host =~ /linux/
    cpus = `nproc`.to_i
    # meminfo shows KB and we need to convert to MB
    mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
  else # sorry Windows folks, I can't help you
    cpus = 4
    mem = 1024
  end
  config.vm.provider "virtualbox" do |v|
    v.memory = mem
    v.cpus = cpus 
  end

  config.vm.network :private_network, ip: IP

  appd_ports = [ 8090, 3388, 4848, 7676, 3700, 8181, 9080, 9081, 9200, 8020, 8021 ]
  extra_ports = [ 5050, 5051 ]
  for port in appd_ports
    config.vm.network :forwarded_port, host: port, guest: port
  end
  for port in extra_ports
    config.vm.network :forwarded_port, host: port, guest: port
  end

  # appd requires minimum of 50GB disk size for DEMO (we have 40GB .. hope we're fine)
  # Obtained UUID via: VBoxManage list hdds
  # below not working due to disk type and only hard to figure out: http://unix.stackexchange.com/a/250679
  #config.vm.provider "virtualbox" do |vb|
    #vb.customize ["modifyhd", "d57cc11e-860b-4782-90fd-d433bf4905ab", "--resize", "100000"]
  #end
end
