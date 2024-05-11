FROM ubuntu:22.04
ARG UID
ARG GID

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive \ 
    apt-get install libncurses-dev gawk flex \
    bison openssl libssl-dev dkms libelf-dev \
    libudev-dev libpci-dev libiberty-dev \
    autoconf llvm git wget -y

RUN addgroup --gid $GID dev && \
    adduser --uid $UID --gid $GID --disabled-password --gecos "" dev 

RUN mkdir -p /home/toolchain /mnt/bootloader /mnt/kernel && \
    chown -R dev:dev /home/toolchain /mnt/bootloader /mnt/kernel

USER dev

WORKDIR /opt/toolchain

ADD --chown=dev:dev https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-arm-none-linux-gnueabihf.tar.xz?rev=adb0c0238c934aeeaa12c09609c5e6fc&hash=B119DA50CEFE6EE8E0E98B4ADCA4C55F arm-gnu-13.2.tar.xz
# RUN ls -l /opt/toolchain
RUN mkdir arm-gnu-13.2-gnueabihf && \
    tar -xf arm-gnu-13.2.tar.xz -C arm-gnu-13.2-gnueabihf --strip-components 1 && \
    rm arm-gnu-13.2.tar.xz

WORKDIR /mnt

RUN cd bootloader && git clone --branch v2024.04 https://github.com/u-boot/u-boot.git

CMD ["/bin/bash"]