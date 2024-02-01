#!/bin/bash

export ARCH=arm64
export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export SEC_BUILD_CONF_VENDOR_BUILD_OS=13

TOOLCHAIN_PATH=~/kernel/toolchain

PATH="$TOOLCHAIN_PATH/clang/bin:$TOOLCHAIN_PATH/aarch64-linux-android-4.9/bin:$TOOLCHAIN_PATH/arm-linux-androideabi-4.9/bin:${PATH}"

make ARCH=arm64 exynos2100-p3sxxx_defconfig
make -j$(nproc --all) \
        ARCH="arm64" \
        CC="clang" \
        CLANG_TRIPLE="aarch64-linux-gnu-" \
        CROSS_COMPILE="aarch64-linux-android-" \
        CROSS_COMPILE_ARM32="arm-linux-androideabi-"
