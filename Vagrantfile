# -*- mode: ruby -*-
# vi: set ft=ruby :


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

FWPORTS = ENV['FWPORTS']

# optional dependencies, these vars are picked
# up inside the ansible roles (see ansible/group_vars)
LLDB     = ENV['LLDB']
CLANG    = ENV['CLANG']
PERF     = ENV['PERF']
DEVEL    = ENV['DEVEL']
DOTFILES = ENV['DOTFILES']
VIM      = ENV['VIM']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/focal64"

  host = RbConfig::CONFIG['host_os']

  # Give VM 1/4 system memory & access to half cpu cores on the host
  if host =~ /darwin/
    cpus = `sysctl -n hw.ncpu`.to_i / 2
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

  config.vm.network "private_network", type: "dhcp"

  if FWPORTS
    for port in 5000..5200
      config.vm.network :forwarded_port, host: port, guest: port
    end
  end
end
