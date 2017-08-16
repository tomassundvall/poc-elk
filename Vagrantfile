# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|

    # configure the boxes
    config.vm.box = "bento/ubuntu-16.04"

    #
    # ELK node for ElasticSearch, LogStash and Kibana
    #
    config.vm.define 'elk-srv' do |elk|
        elk.vm.hostname = 'elk-srv'
        elk.vm.network "private_network", ip: "172.20.20.10"
        elk.vm.provision "shell", privileged: true, path: "install_python.sh"
    end

    #
    # APP node for log production and shippinh with FileBeat
    #
    config.vm.define 'app-srv' do |app|
        app.vm.hostname = 'app-srv'
        app.vm.network "private_network", ip: "172.20.20.11"
        app.vm.provision "shell", privileged: true, path: "install_python.sh"
    end

    #
    # Ansible controller node
    #
    config.vm.define 'controller' do |controller|
        controller.vm.hostname = "controller"
        controller.vm.network "private_network", ip: "172.20.20.99"
        controller.vm.network "forwarded_port", guest: 8080, host: 4567
        controller.vm.provision "shell", privileged: true, inline: <<-EOF
            sudo apt-get update -y

            # Neccesary for ansible (I think? Shoudl be in install_ansible script?)
            sudo apt-get install -y libssl-dev libffi-dev python-dev sshpass

            # Good tools to have
            sudo apt-get install -y tree hto

            # Setup vim profile
            cp /vagrant/.vimrc ~/            
        EOF
        controller.vm.provision "shell", privileged: true, path: "install_ansible.sh"
    end
end
