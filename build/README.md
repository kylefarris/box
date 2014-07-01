box/build
====

inspired by:
[github.com/kentaro/packer-centos-template](https://github.com/kentaro/packer-centos-template)

----
`sh BUILD.sh`

----
**Packer** will:

* obtain CentOS from one of the mirrors specified in **base.json**
* execute anaconda according to **kickstart.cfg**
* install a base CentOS system on top of that minimal kernel
* run **install.sh** on first boot to establish a web application stack

----
Features of **install.sh**:

* create '**root**' user with password '**vagrant**'
* obtain **Remi** and **EPEL** repository database information
* install LAMP-related daemons -- **NFS**, **Apache** w/ **mod_ssl**, **MySQL**, **Sendmail**, **Git**
* in addition, install **NodeJS**, **NPM**, **rubygems**, **Composer**, **Laravel**
* install **PHP** w/ extensions **mysql** **gd** **xml** **mbstring** **mcrypt**
* iptables configuration -- granting 'outside' access to ports **80**, **8081**, **443** and **3306**
* modify **httpd.conf** to listen on ports 80 and 443, and to enable **mod_deflate** (gzip compression)
* modify **php.ini** to set timezone to *America/New_York* and to enable *zlib.output_compression*
* creation of default **VirtualHost** w/ a self-signed SSL certificate
* creation of 'vanilla' **my.cnf** for MySQL
* grant of **MySQL** user '**root**' with password '**vagrant**' with broadest privileges

----
`DESTROY.sh` is used by `BUILD.sh` to remove all artifacts of the build.
