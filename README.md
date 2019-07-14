# Automation Tryouts

## Saltstack

- Test 1: Configure switch when wifi access point is connected, using lldp

### Install
````
emerge app-admin/salt dev-python/pip
pip install junos-eznc -U --user --proxy http://<proxy_host>:<proxy_port>
pip install jxmlease -U --user --proxy http://<proxy_host>:<proxy_port>
pip install jsnapy -U --user --proxy http://<proxy_host>:<proxy_port>
````

### Setup Test Environnment 1

Salt installed on server, IP Address 192.168.0.1  
Copy files in etc and salt on server  
Change /salt/master/pillar/SWITCHTEST.sls with valid credentials for the switch  
Reflect server real IP Address in /etc/salt/proxy  
Reflect switch real IP Address in /salt/master/pillar/SWITCHTEST.sls  

Switch Juniper EX4200 named SWITCHTEST with extra configuration as in [configuration file](./switch/SWITCHTEST_configuration.txt), IP Address 192.168.0.254  
We redirect syslog events to our server  
All ports are part of interface range named PC  
There is a configuration group WIFI for ports with wifi access points connected  

### Execute Test 1
On server :
````
salt-master -l debug
salt-proxy --proxyid=SWITCHTEST -l debug
````

Connect an Wifi Acces Point on the switch


## Ansible

### Install

````
emerge app-admin/ansible dev-python/pip
pip install junos-eznc -U --user --proxy http://<proxy_host>:<proxy_port>
export http_proxy=http://<proxy_host>:<proxy_port>
export https_proxy=http://<proxy_host>:<proxy_port>
ansible-galaxy --ignore-certs install Juniper.junos
````
