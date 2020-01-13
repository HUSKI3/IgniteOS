# IgniteOS
![Build Status](https://travis-ci.com/HUSKI3/IgniteOS.svg?branch=master)](https://travis-ci.com/HUSKI3/IgniteOS)
![](https://document-export.canva.com/DADvyWJmVRc/28/thumbnail/0001-4593677486.png =100x20)

***
  - Donwload: http://bit.ly/downloadigniteos
  - Donate: https://paypal.me/HuskieLunar
***

Ignite Os is a simple linux OS focused on productivity and git tools, optimized with all drivers to run on Chromebooks, Netbooks and micro boards. (Name was changed from FireOS due to Amazons Android based OS)
  - Fast and optimized Push and Pull  
  - Full C library for adding custom components
  - Fully customizable
  - Runs Live and does not affect main drives
  
# Features in progress
  - Some kind of desktop enviroment
  
# New Features!

  - Bosh_cli
  - Node.js


You can also:
  - Use all git tools
  - Add custom tools using fire-overlay


> Not all functions are working. Further development is still required.



### How to build

IgniteOS uses the following tools and requires these dependencies:

* wget 
* make 
* gawk 
* gcc 
* bc 
* bison 
* flex 
* xorriso 
* libelf-dev 
* libssl-dev

IgniteOS requires to be built on a Linux operating system

To build use the following command

```sh
$ chmod +x build.sh
$ sudo ./build.sh
$ sudo ./16_cleanup.sh
```

For repackaging with updates (comming soon)

```sh
$ cmod +x update.sh
$ cmod +x repack.sh
$ sudo ./update.sh && ./repack.sh
```

### Installation
The guide to install on chromebook: https://github.com/HUSKI3/IgniteOS/wiki/Chromebook-Installation
The guide to install on micro board: {in progress}

### Applications

IgniteOS currently has the following packages

| Package | Status |
| ------ | ------ |
| adopt_openjdk | working |
| apt | broken |
| beecrypt | working |
| bosh_cli | working |
| Node.js | broken - libstdc++.so.6 not found. Being fixed. |
| cf_cli | working |
| c2048 | working |
| cf_tools | working |
| coreutils | working |
| dhcp | working |
| dialog | working |
| dropbear | working |
| felix | working |
| fio | working |
| fontconfig | broken - unknown errors |
| glibc-full | working |
| golang | working |
| graalvm | working |
| kbd | unknown - not tested |
| kernel_modules | working |
| kexec_tools | working |
| libdrm | unknown - not compiled |
| libevent | unknown - not compiled |
| libpng | unknown - not compiled |
| libxau | unknown - not compiled |
| libxcb | unknown - not compiled |
| libxdmcp | unknown - not compiled |
| links | broken - headers missing upon compiling |
| lua | working |
| make | working |
| mako | working - numerous bugs |
| nano | working |
| ncurses | working |
| neon | working |
| nspr | working |
| nweb | working |
| openjdk | working |
| python | working |
| rpm | nearly working - Bzip magic error |
| static_get | working |
| stress | unknown - not tested |
| sudo | working |
| vim | working |
| zulujdk | working |


### Development

Want to contribute? Great! You are more than welcome to!



### Docker
Docker support will be added in the future!

#### Kubernetes + Google Cloud

No current support

### Todos

 - Go through more testing
 - Add persistence and partitioning software
 - Add a custom repository manager and packaging system
 
#### Made possible by:
MLL - https://github.com/ivandavidov/minimal
Busybox - https://github.com/mirror/busybox
Linux Kernel - https://www.kernel.org/

License
----

MIT


**Free Software, Hell Yeah!**
