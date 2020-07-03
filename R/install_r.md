* Download the tarball to a directory on the local hard drive (i.e. in /home)
* In the following, change RDir with the actual directory you want to install R to.

```
tar -xzf ****.tgz
./configure --prefix=/mlab/data/software/RDir --enable-R-shlib --with-recommended-packages=no --with-tcltk --with-cairo
make
make install
```

Other Stuff that should be installed first (at least on Fedora)

```
libXt-devel
readline-devel
gcc-c++
java-1.7.0-openjdk-devel
libcurl-devel
mesa-libGLU-devel
libxml2-devel
tcl-devel
tk-devel
cairo-devel
pango-devel
```

For Ubuntu, you will need:

```
sudo apt install libreadline-dev libcairo2-dev g++ libxt-dev libcurl4-openssl-dev libcogl-pango-dev tcl-dev tk-dev default-jre default-jdk libgl-dev libbz2-dev liblzma-dev libudunits2-dev libhdf5-dev libnetcdf-dev gfortran libssl-dev libssh2-1-dev
```