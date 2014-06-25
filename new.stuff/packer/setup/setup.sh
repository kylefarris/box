sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

date > /etc/vagrant_box_build_time

yum -y install wget

mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

cd /tmp
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
sudo rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

yum -y install fuse-devel
wget http://bindfs.org/downloads/bindfs-1.12.5.tar.gz
cd /tmp/bindfs-1.12.5
./configure && make && sudo make install

yum --enablerepo=remi -y update
yum --enablerepo=remi -y install nfs-utils rpcbind nano httpd mysql mysql-server php php-mysql php-gd php-xml php-mbstring php-mcrypt sendmail git-core
yum -y clean all