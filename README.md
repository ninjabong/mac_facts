custom osx specific [facter](http://puppetlabs.com/facter) facts
==========

I use these with [Sal](https://github.com/grahamgilbert/sal), so I find it useful to have a pkg build script like thus:

```
mkdir -p build_root/usr/local/sal/facter
sudo cp *.rb build_root/usr/local/sal/facter
sudo chown -R root:wheel build_root/
/usr/bin/pkgbuild --identifier tld.yourco.sal.facts.pkg \
                  --version 0.1 \
                  --root build_root pkgs/sal_yourco_mac_facts.pkg
```
