# chef-cuneiform

Chef cookbook to set up Cuneiform and its dependencies.


## Requirements

### Platforms

- CentOS
- Debian
- Fedora
- openSUSE
- Ubuntu

### Chef

- Chef 12.14+

### Cookbooks

- rebar3
  - erlang
    - build-essential
    - mingw
    - seven_zip
    - windows
    - yum-epel
    - yum-erlang_solutions

## Attributes

### Cuneiform Attributes

- `node['cuneiform']['version']` The Cuneiform version. Defaults to `'3.0.3'`.

### Java Attributes

- `node['java']['jdk_version']` The JDK version. Set to `'8'`.
- `node['java']['install_flavor']` The JDK provider. Set to `'openjdk'`.

## Integration Tests

To run the automated test suite run

    kitchen verify


## Authors

- Jörgen Brandt ([@joergen7](https://github.com/joergen7/)) [joergen.brandt@onlinehome.de](mailto:joergen.brandt@onlinehome.de)

## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)