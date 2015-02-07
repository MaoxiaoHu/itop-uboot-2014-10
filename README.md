# itop-uboot-2014-10

/**
******************************************************************************
* @author    Maoxiao Hu
* @version   V1.0.0
* @date       Feb-2015
******************************************************************************
* < COPYRIGHT 2015 ISE of SHANDONG UNIVERSITY >
******************************************************************************
**/

--------------------说明-------------------------

基于迅为4412精英版的u-boot-2014-10移植

如何编译：

1. 在源码目录执行 make trats2_defconfig
2. 在源码目录执行 make

如何制作TF卡启动盘：

1. 至少需要清空TF卡前1MB的空间。
2. 将文件 E4412_N.bl1.bin 烧写到TF卡的第1（而不是第0）个block。
3. 将文件 checksum_bl2_14k.bin 烧写到TF卡的第17个block。
4. 将文件 u-boot.bin 烧写到TF卡的第49个block。
5. 将TF卡插入卡槽，上电启动。


-------------------Introduction------------------

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
