Vagrant.configure(2) do |config|
  config.vm.box = "phusion-open-ubuntu-14.04-amd64"
  config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  
    for i in 25000..25200
        config.vm.network :forwarded_port, guest: i, host: i
    end

  if Dir.glob("#{File.dirname(__FILE__)}/.vagrant/machines/default/*/id").empty?
    # Install Docker
    pkg_cmd = "wget -q -O - https://get.docker.io/gpg | apt-key add -;" \
      "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list;" \
      "apt-get update -qq; apt-get install -q -y --force-yes lxc-docker; " \
      "export DEBIAN_FRONTEND=noninteractive;" \
      "echo mariadb-server-5.5 mysql-server/root_password password pass123 | debconf-set-selections;" \
      "echo mariadb-server-5.5 mysql-server/root_password_again password pass123 | debconf-set-selections;" \
      "sudo apt-get -y install mariadb-server;" \
      "/vagrant/setup-apps.sh;"
    # Add vagrant user to the docker group
    pkg_cmd << "usermod -a -G docker vagrant; "
    config.vm.provision :shell, :inline => pkg_cmd
  end
end
