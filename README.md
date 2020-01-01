# FireOS


Fire Os is a simple linux OS focused on productivity and git tools.
  - Fast and optimized Push and Pull  
  - Full C library for adding custom components
  - Fully customizable
  - Runs Live and does not effect main drives

# New Features!

  - SSH connection
  - Network tools
  - Kernel_headers


You can also:
  - Use all git tools
  - Add custom tools using fire-overlay


> Not all functions are working, further development is still required.



### How to build

FireOS uses the following tools and requires these dependencies:

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


### Installation

FireOS requires to be run on a linux operating system

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

### Applications

FireOS currently has the following packages

| Package | Status |
| ------ | ------ |
| adopt_openjdk | working |
| apt | broken |
| beecrypt | working |
| bosh_cli | working |
| cf_cli | working |
| c2048 | working |
| cf_tools | working |
| coreutils | working |
| dhcp | working |
| dialog | working |
| dropbear | working |
| felix | working |
| fio | working |
| fontconfig | broken - unkown errors |
| glibc-full | working |
| golang | working |
| graalvm | working |
| kbd | unkown - not tested |
| kernel_modules | working |
| kexec_tools | working |
| libdrm | unkown - not compiled |
| libevent | unkown - not compiled |
| libpng | unkown - not compiled |
| libxau | unkown - not compiled |
| libxcb | unkown - not compiled |
| libxdmcp | unkown - not compiled |
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
| stress | unkown - not tested |
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
 - Add percistance and partitioning software
 - Add a custom repository manager and packaging system
 
#### Made possible by:
MLL - https://github.com/ivandavidov/minimal
Busybox - https://github.com/mirror/busybox
Linux Kernel - https://www.kernel.org/

License
----

MIT


**Free Software, Hell Yeah!**
