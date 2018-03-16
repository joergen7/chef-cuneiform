# chef-cuneiform

Chef cookbook to set up vanilla Cuneiform on an Ubuntu machine.


## Prerequisites

Install the following packages:

- [git](https://git-scm.com/)
- [Chef Development Kit](https://downloads.chef.io/chef-dk/)

If you want to set up a VM to test Cuneiform these additional packages are required:

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

Under Ubuntu you can install the ChefDK by entering on the command line

    sudo dpkg -i chefdk_*.deb


## Building a VM with kitchen

This section describes how to set up vanilla Cuneiform in a Virtual
Machine (VM). To do this, it does not matter whether you are running Linux,
Mac OS, or Windows. However, if you are running an Ubuntu you may want to
install Cuneiform directly without creating a VM (see Section Building locally).

To build a VM from this cookbook for the first time, change your git
base directory and enter the following:

    git clone https://github.com/joergen7/chef-cuneiform.git
    cd chef-cuneiform
    kitchen converge
    
You can log into the newly built VM by entering

    kitchen login
    
You can drop the VM by entering

    kitchen destroy

## Building locally

This section describes how to set up Cuneiform locally without the indirection
of a VM. If you want to try out Cuneiform in a VM first see Section Building a VM with kitchen.

To install this cookbook locally, create a directory "cookbooks", clone the cookbook
into it and run the chef client:

    mkdir cookbooks
    cd cookbooks
    git clone https://github.com/joergen7/chef-cuneiform.git
    cd ..
    sudo chef-client -z -r "chef-cuneiform::default"
    
## Testing your installation

If you have installed Cuneiform on a VM you have to login to that VM first by entering

    kitchen login

To test whether Cuneiform works, run

    cuneiform --help


## Authors

- Jörgen Brandt ([@joergen7](https://github.com/joergen7/)) [joergen.brandt@onlinehome.de](mailto:joergen.brandt@onlinehome.de)

## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)