Vagrant.configure(2) do |config|
  config.vm.box = "phusion-open-ubuntu-14.04-amd64"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  
  config.vm.network "private_network", ip: "192.168.50.100"

  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?
    # Install Docker
    pkg_cmd = "wget -q -O - https://get.docker.io/gpg | apt-key add -;" \
      "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list;" \
      "apt-get update -qq; apt-get install -q -y --force-yes lxc-docker; " \
      "export DEBIAN_FRONTEND=noninteractive;" \
      "echo mariadb-server-5.5 mysql-server/root_password password pass123 | debconf-set-selections;" \
      "echo mariadb-server-5.5 mysql-server/root_password_again password pass123 | debconf-set-selections;" \
      "sudo apt-get -y install mariadb-server;" \
      "echo 'bind-address            = 172.17.0.1' >> /etc/mysql/my.cnf;" \
      "service mysql restart;" \
      "/vagrant/setup-apps.sh;"
    # Add vagrant user to the docker group
    pkg_cmd << "usermod -a -G docker vagrant; "
    config.vm.provision :shell, :inline => pkg_cmd
  end
end
