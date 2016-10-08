# LEMP Boilerplate
Clone this project or download VagrantFile and .provision into your own project.

# Requirements
Make sure you have the following installed on your system:

* [VirtualBox](https://www.virtualbox.org/)

* [Vagrant](https://www.vagrantup.com/)

* [PhpStorm](https://www.jetbrains.com/phpstorm/) (optional) 

# Description
This Vagrant machine will be installed and configured as a LEMP stack. This is not secured so do NOT use this in production.

## Nginx
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
    
    $controllerName = $url[1]; // member
    $actionName = $url[2]; // edit
    $param = $url[3]; // 1
}
```

You have access to an variable "APPLICATION_ENV" that is set to "test".
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

## PHP7
Install only, no config is done.

## MySQL
Will be installed with default password "test" (without the quotes).
```
sudo mysql -u root -p
```

## Get the repo and init Vagrant
Either you clone this repo or you just download necessary files into your own project.

### Clone or Download
1. Clone (`git clone https://github.com/tr222cj/vagrant-lemp-mvc-box.git your-exercise-folder-name`).  
-or-  
Download VagranFile and .provision into your own project

2. Go to the newly created folder and start the virtual machine using `vagrant up` in the terminal

3. Take a cuppa! This will take some time since it will also install all the necessary modules.

NB! Ignore messages like:  
"ttyname failed: Inappropriate ioctl for device"  
"dpkg-preconfigure: unable to re-open stdin: No such file or directory"

# Configure PhpStorm 2016.2 
Configure a remote php interpreter and remote web server (so the built in one is not used).

1. Start PhpStorm and make a project in the folder you created. Make sure Vagrant is still running the guest.

2. Go to "File" -> "Settings" (can also be "PhpStorm -> "Preferences") in the menu. Go to "Languages & Frameworks" -> "PHP".

3. Click on the three dots to the right of the `<no interpreter>` text (may say 'PHP 7' or similar if you have a local installation since before).

4. Click on the "+" button in the top left corner. Click on "Remote...".

5. Click on Vagrant to the left in the dialogue and it will automatically find your guest installation. Click OK to save and click Yes on any RSA-key questions. Click OK again to close dialogue.

6. Select the same PHP language level as interpreter version (version 7 for both). Click OK to close.

# Production
If you want to run a similar environment in production follow this guide:  
[How To Install Linux, Nginx, MySQL, PHP (LEMP stack) in Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04)

# Inspired by
https://github.com/daalsmark/php-vagrant-boilerplate  
https://www.sitepoint.com/vagrantfile-explained-setting-provisioning-shell/

## Disclaimer
The creator assumes no responsibility for any loss or hardship (be it loss of life, property, equipment, bodily injury, money, time or other) incurred directly or indirectly by using this boilerplate or any of it's contents.
