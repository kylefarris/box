VBoxManage list runningvms|awk '{print $2;}'|xargs -I vmid VBoxManage controlvm vmid poweroff
vagrant box remove base
vagrant destroy base -f
rm -rf $HOME/VirtualBox\ VMs/base*
rm -rf $HOME/.vagrant.d/boxes/base
rm -rf packer_cache
rm -rf output-virtualbox-iso
rm -rf .vagrant
rm -rf ../.vagrant
