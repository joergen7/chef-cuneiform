# chef-cuneiform
Chef cookbook to setup vanilla Cuneiform

To install Cuneiform locally, create a directory "cookbooks", clone the cookbook
into it and install the dependencies:

    mkdir cookbooks
    cd cookbooks
    git clone https://github.com/joergen7/chef-cuneiform.git
    cd ..
    chef-client -z -r "variant-call::default"
