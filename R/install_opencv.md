If you want to install *all* of the OpenCV library on your machine, the best bet is to build it from scratch.
This assumes you probably have all of the dependencies for the software met, and just need to download the base OpenCV and the contributed packages.

```
wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/master.zip

unzip master.zip
unzip opencv_contrib.zip

mkdir -p build
cd build

# for opencv R package, need the "pkg-config" to be generated, and generating the extra modules
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-master/modules -DOPENCV_GENERATE_PKGCONFIG=ON ../opencv-master

cmake --build .
sudo make install
```
