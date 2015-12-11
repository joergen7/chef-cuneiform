# chef-cuneiform

Chef cookbook to set up vanilla Cuneiform on an Ubuntu machine.


## Prerequisites

The Chef DK can be downloaded from the [Chef download page](https://downloads.chef.io/chef-dk/).
To install it enter on the command line

    sudo dpkg -i chefdk_*.deb

## Setting up Cuneiform

To install Cuneiform on your Ubuntu machine, create a directory "cookbooks", clone the cookbook
into it and execute it:

    mkdir cookbooks
    cd cookbooks
    git clone https://github.com/joergen7/chef-cuneiform.git
    cd ..
    sudo chef-client -z -r "chef-cuneiform::default"
