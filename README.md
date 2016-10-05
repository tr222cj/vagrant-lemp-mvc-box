# LEMP Boilerplate
!!!WIP!!!  

## Description
This Vagrant machine will be installed and configured as a LEMP stack. This is not secured so do NOT run this in production.

### Nginx
Will be configured for MVC urls e.g. localhost/member/edit/1
```
location / {
    try_files $uri $uri/ /index.php?$args;
}
```

Usage example:
```
private static function getControllerAndActionFromUrl() {
    $url = explode("/", $_SERVER["REQUEST_URI"]);
    
    $controllerName = $url[1];
    $actionName = $url[2];
    $param = $url[3];
}
```

You will also have access to an variable "APPLICATION_ENV".
```
location ~ \.php$ {
    ...
    fastcgi_param APPLICATION_ENV "test"; 
    ...
}
```

Usage example:
```
if (getenv("APPLICATION_ENV") === "test") {
    // SETTINGS THAT WILL BE ACTIVE IN TEST ENVIRONMENT ONLY
}
```

### PHP7
Install only, no config is done.

### MySQL
Will be installed with default password "test" (without the quotes).
```
sudo mysql -u root -p
```

## Requirements
Make sure you have the following installed on your system:
* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)
* [PhpStorm](https://www.jetbrains.com/phpstorm/) (optional) 

## Get the repo and init Vagrant
1. Clone (`git clone https://github.com/tr222cj/vagrant-lemp-mvc-box.git your-exercise-folder-name`) to create your exercise folder. 
2. Go to the newly created folder and start the virtual machine using `vagrant up` in the terminal
3. Take a cuppa! This will take some time since it will install all the necessary modules.

Ignore messages like:  
"ttyname failed: Inappropriate ioctl for device"  
"dpkg-preconfigure: unable to re-open stdin: No such file or directory"

## Production
If you want to run a similar environment in production follow this guide:  
[How To Install Linux, Nginx, MySQL, PHP (LEMP stack) in Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04)

# Inspired by
https://github.com/daalsmark/php-vagrant-boilerplate  
https://www.sitepoint.com/vagrantfile-explained-setting-provisioning-shell/

## Disclaimer
The creator assumes no responsibility for any loss or hardship (be it loss of life, property, equipment, bodily injury, money, time or other) incurred directly or indirectly by using this boilerplate or any of it's contents.
