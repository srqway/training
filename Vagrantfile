Vagrant.configure(2) do |config|
    config.vm.provider :virtualbox do |vb|
        vb.memory = 1048
        vb.cpus = 2
    end

    config.vm.box = "bento/centos-7.3"
    config.vm.box_version = "201708.22.0"

    config.vm.provider :virtualbox do |vb|
        vb.name = "backup-training"
    end

    # Provision the VM
    config.vm.provision "shell", inline: <<-SHELL
        echo 'Build Begin' && date

        # Install docker
        echo 'Install Docker' && date
        yum install -y yum-utils 2>&1
        sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 2>&1
        yum makecache fast 2>&1
        yum install -y docker-ce 2>&1
        systemctl start docker 2>&1
        usermod -aG docker vagrant 2>&1

        # Install XML::Checker::Parser
        yum install -y \
            http://ftp.tu-chemnitz.de/pub/linux/dag/redhat/el6/en/i386/rpmforge/RPMS/perl-XML-Checker-0.13-1.el6.rf.noarch.rpm \
            perl-Digest-SHA perl-JSON-PP 2>&1

        # Build container images
        echo 'Build container images' && date
        rm -f /training/docker/id_rsa* 2>&1
        sudo -u vagrant ssh-keygen -f /training/docker/id_rsa -t rsa -N '' 2>&1
        sudo -u vagrant docker build -f /training/docker/co7-base.docker -t training/co7-base /training/docker 2>&1
        sudo -u vagrant docker build -f /training/docker/co7-db.docker -t training/co7-db /training/docker 2>&1

        # Install docDynamo for doc automation
        yum install -y git 2>&1
        git clone https://github.com/pgbackrest/pgbackrest.git /docdynamo 2>&1
        cd /docdynamo && git checkout 84caca0f341982d7d61d1c310faf5c6a3a601a48 2>&1
        echo 'Build End' && date
    SHELL

  # Don't share the default vagrant folder
  config.vm.synced_folder ".", "/vagrant", disabled: true

  # Mount project path for testing
  config.vm.synced_folder ".", "/training", type: "virtualbox"
end
