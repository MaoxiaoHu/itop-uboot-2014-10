/*
 *  Copyright (C) 2012 Samsung Electronics
 *  Rajeshwari Shinde <rajeshwari.s@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <common.h>
#include <fdtdec.h>
#include <i2c.h>
#include <power/pmic.h>
#include <power/s5m8767a_pmic.h>
#include <errno.h>

DECLARE_GLOBAL_DATA_PTR;

static const char s5m8767a_buck_addr[] = {
    0xff,
    S5M8767A_REG_PMIC_BUCK1_CTRL1,
    S5M8767A_REG_PMIC_BUCK2_CTRL,
    S5M8767A_REG_PMIC_BUCK3_CTRL,
    S5M8767A_REG_PMIC_BUCK4_CTRL,
    S5M8767A_REG_PMIC_BUCK5_CTRL1,
    S5M8767A_REG_PMIC_BUCK6_CTRL1,
    S5M8767A_REG_PMIC_BUCK7_CTRL1,
    S5M8767A_REG_PMIC_BUCK8_CTRL1,
    S5M8767A_REG_PMIC_BUCK9_CTRL1
};

static unsigned int s5m8767a_ldo_volt2hex(int ldo, ulong uV)
{
	unsigned int hex = 0;

	switch (ldo) {
	case 1:
	case 2:
	case 6:
	case 7:
	case 8:
	case 15:
		hex = (uV - 800000) / 25000;
		break;
	default:
		hex = (uV - 800000) / 50000;
	}

	if (hex >= 0 && hex <= S5M8767A_LDO_VOLT_MAX_HEX)
		return hex;

	debug("%s: %ld is wrong voltage value for LDO%d\n", __func__, uV, ldo);
	return 0;
}

int s5m8767a_set_ldo_voltage(u8 chip, int ldo, ulong uV)
{
	unsigned int val, hex, adr;

	if (ldo < 1 && ldo > 28) {
		printf("%s: %d is wrong ldo number\n", __func__, ldo);
		return -1;
	}
    
    if(ldo == 1)
        adr = S5M8767A_REG_PMIC_NLDO1_CTRL;
    else if(ldo == 2)
        adr = S5M8767A_REG_PMIC_NLDO2_CTRL;
    else{
        adr = S5M8767A_REG_PMIC_PLDO3_CTRL + ldo - 3; 
    }
    
    hex = s5m8767a_ldo_volt2hex(ldo, uV);

	if (!hex)
		return -1;

	val =i2c_reg_read(chip, adr);

	val &= ~S5M8767A_LDO_VOLT_MASK;
	val |= hex;
    i2c_reg_write(chip, adr, val);

	return 0;
}

int s5m8767a_set_ldo_mode(u8 chip, int ldo, char opmode)
{
	unsigned int val, adr, mode;

	if (ldo < 1 && 28 < ldo) {
		printf("%s: %d is wrong ldo number\n", __func__, ldo);
		return -1;
	}

    if(ldo == 1)
        adr = S5M8767A_REG_PMIC_NLDO1_CTRL;
    else if(ldo == 2)
        adr = S5M8767A_REG_PMIC_NLDO2_CTRL;
    else{
        adr = S5M8767A_REG_PMIC_PLDO3_CTRL + ldo - 3; 
    }
 
	/* mode */
	switch (opmode) {
	case OPMODE_OFF:
        switch (ldo) {
            case 3:
                mode = S5M8767A_LDO_OFF_NOT_AVALIABLE;
		        break;
            case 4:
            case 18:
            case 23:
                mode = S5M8767A_LDO_MODE_CTRL_BY_LDOxEN;
		        break;
            default:
                mode = S5M8767A_LDO_MODE_OFF;
        }
		break;
	case OPMODE_STANDBY:
		switch (ldo) {
            case 4:
            case 18:
            case 23:
                mode = S5M8767A_LDO_MODE_CTRL_BY_PWREN_AND_LDOxEN;
		        break;
            default:
                mode = S5M8767A_LDO_MODE_CTRL_BY_PWREN;
		}
		break;
	case OPMODE_LPM:
        switch (ldo) {
            case 4:
            case 18:
            case 23:
                mode = S5M8767A_LDO_MODE_ON_CHANGE_BY_PWREN_AND_LDOxEN;
		        break;
            default:
                mode = S5M8767A_LDO_MODE_ON_CHANGE_BY_PWREN;
		}
		break;
	case OPMODE_ON:
		mode = S5M8767A_LDO_MODE_ON;
		break;
	default:
		mode = 0xff;
	}

	if (mode == 0xff) {
		printf("%s: %d is not supported on LDO%d\n",
		       __func__, opmode, ldo);
		return -1;
	}

	val = i2c_reg_read(chip, adr);

	val &= ~S5M8767A_LDO_MODE_MASK;
	val |= (mode << 0x06);
	i2c_reg_write(chip, adr, val);

	return 0;
}

int s5m8767a_set_buck_mode(u8 chip, int buck, char opmode)
{
	unsigned int val, adr, size, mode;

	size = ARRAY_SIZE(s5m8767a_buck_addr);
	if (buck >= size) {
		printf("%s: %d is wrong buck number\n", __func__, buck);
		return -1;
	}

	adr = s5m8767a_buck_addr[buck];
	/* mode */
	switch (opmode) {
	case OPMODE_OFF:
		mode = S5M8767A_BUCK_MODE_OFF;
		break;
	case OPMODE_STANDBY:
		mode = S5M8767A_BUCK_MODE_STANDBY;
		break;
	case OPMODE_LPM:/* only buck5 has this mode */
		switch (buck) {
		case 5:
			mode = S5M8767A_BUCK_MODE_LPM;
			break;
		default:
			mode = 0xff;
		}
		break;
	case OPMODE_ON:
		mode = S5M8767A_BUCK_MODE_ON;
		break;
	default:
		mode = 0xff;
	}

	if (mode == 0xff) {
		printf("%s: %d is not supported on BUCK%d\n",
		       __func__, opmode, buck);
		return -1;
	}

	val = i2c_reg_read(chip, adr);

	val &= ~S5M8767A_BUCK_MODE_MASK;
	val |= (mode << 0x06);
    i2c_reg_write(chip, adr, val);

	return 0;
}

int pmic_init()
{
	const void *blob = gd->fdt_blob;
	int node, parent, bus_num, bus_speed;
    int ret;
	node = fdtdec_next_compatible(blob, 0, COMPAT_SAMSUNG_S5M8767A_PMIC);
	if (node < 0) {
		debug("PMIC: No node for PMIC Chip in device tree\n");
		debug("node = %d\n", node);
		return -1;
	}

	parent = fdt_parent_offset(blob, node);
	if (parent < 0) {
		debug("%s: Cannot find node parent\n", __func__);
		return -1;
	}

	/* tmp since p->bus is unsigned */
	bus_num = i2c_get_bus_num_fdt(parent);
	if (bus_num < 0) {
		debug("%s: Cannot find I2C bus\n", __func__);
		return -1;
	}

    ret = i2c_set_bus_num(bus_num);
    if (ret < 0) {
		debug("%s: Cannot set bus num\n", __func__);
		return -1;
	}
    
    bus_speed = i2c_get_bus_speed_fdt(parent);
    if(bus_speed < 0) {
		debug("%s: Cannot get bus speed\n", __func__);
		return -1;
	}

    ret =  i2c_set_bus_speed(bus_speed);
    if(ret < 0) {
		debug("%s: Cannot set bus speed\n", __func__);
		return -1;
	}
    
    ret = i2c_probe(S5M8767A_I2C_ADDR);
    if( ret > 0 ){
		debug("%s: Cannot probe pmic\n", __func__);
		return -1;
    } 
	puts("Board PMIC probed\n");

	return 0;
}
