set -e -x

#source /etc/lsb-release

function do_yum() {
  #apt-get -f -y --force-yes --no-install-recommends "$@"
  yum -t -y "$@"
}

# bind9-host
# build-essential
# dnsutils
# git-core
# imagemagick
# iputils-arping
# libcap2-bin
# libaio1
# libbz2-dev
# libcurl3
# libcurl3-dev
# libmagick9-dev
# libmysqlclient-dev
# libncurses5-dev
# libpq-dev
# libreadline6-dev
# libsqlite-dev
# libsqlite3-dev
# libssl-dev
# libxslt1-dev
# libxslt1.1
# netcat
# vim
packages="
  bison
  curl
  dnsutils
  flex
  gdb
  git
  iputils
  less
  libcurl
  libcurl-devel
  libxml2
  libxml2-devel
  libxslt
  libxslt-devel
  libyaml
  libyaml-devel
  lsof
  openssh-server
  python
  psmisc
  quota
  rsync
  strace
  sysstat
  tcpdump
  traceroute
  unzip
  wget
  zip
"

#cat > /etc/apt/sources.list <<EOS
#deb http://archive.ubuntu.com/ubuntu $DISTRIB_CODENAME main universe multiverse
#deb http://archive.ubuntu.com/ubuntu $DISTRIB_CODENAME-updates main universe multiverse
#deb http://security.ubuntu.com/ubuntu $DISTRIB_CODENAME-security main universe multiverse
#EOS

#subscription-manager register --insecure --auto-attach

# cannot upgrade udev; need --privileged during build
#
# see https://github.com/dotcloud/docker/pull/2979
#echo "udev hold" | dpkg --set-selections

# install gpgv so we can update
do_yum install gpgv

##do_yum update

# upgrade upstart first to prevent it from messing up our stubs and starting daemons anyway
#yum install upstart

#do_yum install $packages

#yum dist-upgrade

#apt-get clean
##do_yum clean all
