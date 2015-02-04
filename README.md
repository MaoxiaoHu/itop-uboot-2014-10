# itop-uboot-2014-10
u-boot for xunwei iTop4412 evaluation board based on u-boot-2014-10

How to make:
1. make trats2_defconfig
2. make

How to make TF boot card:
1. Make sure to clear TF card first 1MB space to all 0x00.
2. Flash E4412_N.bl1.bin to TF card block 1.
3. Flash checksum_bl2_14k.bin to TF card block 17.
4. Flash u-boot.bin to TF card block 49.
5. Insert TF card and boot.
