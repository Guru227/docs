git clone git@github.com:DPDK/dpdk.git
pip3 install pyelftools
sudo apt install meson
meson -Dexamples=all build
ninja -C build

cd build
ninja install


# Sources

1. (ninja install) http://doc.dpdk.org/guides-20.02/prog_guide/build-sdk-meson.html
1. (quick guide) https://core.dpdk.org/doc/quick-start/
1. 