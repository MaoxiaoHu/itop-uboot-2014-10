/*
 *  Copyright (C) 2012 Samsung Electronics
 *  Rajeshwari Shinde <rajeshwari.s@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#ifndef __S5M8767A_H_
#define __S5M8767A_H_

#include <power/pmic.h>

enum {
	S5M8767A_REG_PMIC_ID		= 0x0,
	S5M8767A_REG_PMIC_ONOFF_INT1,
	S5M8767A_REG_PMIC_ONOFF_INT2,
	S5M8767A_REG_PMIC_RTC_INT3,
	S5M8767A_REG_PMIC_ONOFF_INT1M,
	S5M8767A_REG_PMIC_ONOFF_INT2M,
	S5M8767A_REG_PMIC_RTC_INT3M,

	S5M8767A_REG_PMIC_STATUS1 = 0x7,
	S5M8767A_REG_PMIC_STATUS2,

	S5M8767A_REG_PMIC_CTRL1 = 0xA,
	S5M8767A_REG_PMIC_CTRL2,

	S5M8767A_REG_PMIC_BU_CHG = 0xE,
	S5M8767A_REG_PMIC_DVS_RAMP,
	
	S5M8767A_REG_PMIC_LDO1CTRL1	= 0x13,
	S5M8767A_REG_PMIC_LDO2CTRL1,
	S5M8767A_REG_PMIC_LDO3CTRL1,
	S5M8767A_REG_PMIC_LDO4CTRL1,
	S5M8767A_REG_PMIC_LDO5CTRL1,
	S5M8767A_REG_PMIC_LDO6CTRL1,
	S5M8767A_REG_PMIC_LDO7CTRL1,
	S5M8767A_REG_PMIC_LDO8CTRL1,
	S5M8767A_REG_PMIC_LDO9CTRL1,
	S5M8767A_REG_PMIC_LDO10CTRL1,
	S5M8767A_REG_PMIC_LDO11CTRL1,
	S5M8767A_REG_PMIC_LDO12CTRL1,
	S5M8767A_REG_PMIC_LDO13CTRL1,
	S5M8767A_REG_PMIC_LDO14CTRL1,
	S5M8767A_REG_PMIC_LDO15CTRL1,
	S5M8767A_REG_PMIC_LDO16CTRL1,
	S5M8767A_REG_PMIC_LDO17CTRL1,
	S5M8767A_REG_PMIC_LDO18CTRL1,
	S5M8767A_REG_PMIC_LDO19CTRL1,
	S5M8767A_REG_PMIC_LDO20CTRL1,
	S5M8767A_REG_PMIC_LDO21CTRL1,
	S5M8767A_REG_PMIC_LDO22CTRL1,
	S5M8767A_REG_PMIC_LDO23CTRL1,
	S5M8767A_REG_PMIC_LDO24CTRL1,
	S5M8767A_REG_PMIC_LDO25CTRL1,
	S5M8767A_REG_PMIC_LDO26CTRL1,
	S5M8767A_REG_PMIC_LDO27CTRL1,
	S5M8767A_REG_PMIC_LDO28CTRL1,

	S5M8767A_REG_PMIC_UVLO = 0x31,

	S5M8767A_REG_PMIC_BUCK1_CTRL1 = 0x32,
	S5M8767A_REG_PMIC_BUCK1_CTRL2,
	S5M8767A_REG_PMIC_BUCK2_CTRL,
	S5M8767A_REG_PMIC_BUCK2_DVS1,
	S5M8767A_REG_PMIC_BUCK2_DVS2,
	S5M8767A_REG_PMIC_BUCK2_DVS3,
	S5M8767A_REG_PMIC_BUCK2_DVS4,
	S5M8767A_REG_PMIC_BUCK2_DVS5,
	S5M8767A_REG_PMIC_BUCK2_DVS6,
	S5M8767A_REG_PMIC_BUCK2_DVS7,
	S5M8767A_REG_PMIC_BUCK2_DVS8,
	S5M8767A_REG_PMIC_BUCK3_CTRL = 0x3D,
	S5M8767A_REG_PMIC_BUCK3_DVS1,
	S5M8767A_REG_PMIC_BUCK3_DVS2,
	S5M8767A_REG_PMIC_BUCK3_DVS3,
	S5M8767A_REG_PMIC_BUCK3_DVS4,
	S5M8767A_REG_PMIC_BUCK3_DVS5,
	S5M8767A_REG_PMIC_BUCK3_DVS6,
	S5M8767A_REG_PMIC_BUCK3_DVS7,
	S5M8767A_REG_PMIC_BUCK3_DVS8,
	S5M8767A_REG_PMIC_BUCK4_CTRL = 0x46,
	S5M8767A_REG_PMIC_BUCK4_DVS1,
	S5M8767A_REG_PMIC_BUCK4_DVS2,
	S5M8767A_REG_PMIC_BUCK4_DVS3,
	S5M8767A_REG_PMIC_BUCK4_DVS4,
	S5M8767A_REG_PMIC_BUCK4_DVS5,
	S5M8767A_REG_PMIC_BUCK4_DVS6,
	S5M8767A_REG_PMIC_BUCK4_DVS7,
	S5M8767A_REG_PMIC_BUCK4_DVS8,
	S5M8767A_REG_PMIC_BUCK5_CTRL1 = 0x4F,
	S5M8767A_REG_PMIC_BUCK5_DVS1,
	S5M8767A_REG_PMIC_BUCK5_DVS2,
	S5M8767A_REG_PMIC_BUCK5_DVS3,
	S5M8767A_REG_PMIC_BUCK5_DVS4,
	S5M8767A_REG_PMIC_BUCK6_CTRL1,
	S5M8767A_REG_PMIC_BUCK6_CTRL2,
	S5M8767A_REG_PMIC_BUCK7_CTRL1,
	S5M8767A_REG_PMIC_BUCK7_CTRL2,
	S5M8767A_REG_PMIC_BUCK8_CTRL1,
	S5M8767A_REG_PMIC_BUCK8_CTRL2,
	S5M8767A_REG_PMIC_BUCK9_CTRL1,
	S5M8767A_REG_PMIC_BUCK9_CTRL2,
	
	S5M8767A_REG_PMIC_NLDO1_CTRL = 0x5C,
	S5M8767A_REG_PMIC_NLDO2_CTRL,
	S5M8767A_REG_PMIC_PLDO3_CTRL = 0x61,
	S5M8767A_REG_PMIC_PLDO4_CTRL,
	S5M8767A_REG_PMIC_PLDO5_CTRL,
	S5M8767A_REG_PMIC_NLDO6_CTRL = 0x64,
	S5M8767A_REG_PMIC_NLDO7_CTRL,
	S5M8767A_REG_PMIC_NLDO8_CTRL,
	S5M8767A_REG_PMIC_PLDO9_CTRL,
	S5M8767A_REG_PMIC_PLDO10_CTRL,
	S5M8767A_REG_PMIC_PLDO11_CTRL,
	S5M8767A_REG_PMIC_PLDO12_CTRL,
	S5M8767A_REG_PMIC_PLDO13_CTRL,
	S5M8767A_REG_PMIC_PLDO14_CTRL,
	S5M8767A_REG_PMIC_NLDO15_CTRL = 0x6D,
	S5M8767A_REG_PMIC_PLDO16_CTRL,
	S5M8767A_REG_PMIC_PLDO17_CTRL,
	S5M8767A_REG_PMIC_PLDO18_CTRL,
	S5M8767A_REG_PMIC_PLDO19_CTRL,
	S5M8767A_REG_PMIC_PLDO20_CTRL,
	S5M8767A_REG_PMIC_PLDO21_CTRL,
	S5M8767A_REG_PMIC_PLDO22_CTRL,
	S5M8767A_REG_PMIC_PLDO23_CTRL,
	S5M8767A_REG_PMIC_PLDO24_CTRL,
	S5M8767A_REG_PMIC_PLDO25_CTRL,
	S5M8767A_REG_PMIC_PLDO26_CTRL,
	S5M8767A_REG_PMIC_PLDO27_CTRL,
	S5M8767A_REG_PMIC_PLDO28_CTRL,
   
	S5M8767A_REG_PMIC_PWRONSRC = 0xE0,
    PMIC_NUM_OF_REGS,
};

/* I2C device address for pmic s5m8767a */
#define S5M8767A_I2C_ADDR (0xCC >> 1)

enum {
	REG_DISABLE = 0,
	REG_ENABLE
};

enum {
	LDO_OFF = 0,
	LDO_ON,

	DIS_LDO = (0x00 << 6),
	EN_LDO = (0x3 << 6),
};

enum {
	OPMODE_OFF = 0,
	OPMODE_STANDBY,
	OPMODE_LPM,
	OPMODE_ON,
};

int s5m8767a_set_ldo_voltage(u8 chip, int ldo, ulong uV);
int s5m8767a_set_ldo_mode(u8 chip, int ldo, char opmode);
int s5m8767a_set_buck_mode(u8 chip, int buck, char opmode);

#define S5M8767A_LDO_VOLT_MAX_HEX	0x3f
#define S5M8767A_LDO_VOLT_MASK		0x3f
#define S5M8767A_LDO_MODE_MASK		0xc0
#define S5M8767A_LDO_MODE_OFF		0x00
#define S5M8767A_LDO_MODE_CTRL_BY_LDOxEN 0x00/* ldo 4 18 23 only */
#define S5M8767A_LDO_OFF_NOT_AVALIABLE  0x00/* ldo 3 only*/
#define S5M8767A_LDO_MODE_CTRL_BY_PWREN	0x01
#define S5M8767A_LDO_MODE_CTRL_BY_PWREN_AND_LDOxEN  0x01/* ldo 4 18 23 only*/
#define S5M8767A_LDO_MODE_ON_CHANGE_BY_PWREN		0x02
#define S5M8767A_LDO_MODE_ON_CHANGE_BY_PWREN_AND_LDOxEN  0x02/* ldo 4 18 23 only*/
#define S5M8767A_LDO_MODE_ON		0x03/* used by all ldo*/
#define S5M8767A_BUCK_MODE_MASK		0xc0
#define S5M8767A_BUCK_MODE_OFF		0x00
#define S5M8767A_BUCK_MODE_STANDBY	0x01
#define S5M8767A_BUCK_MODE_LPM		0x02
#define S5M8767A_BUCK_MODE_ON		0x03

/* Buck1 1 volt value */
#define S5M8767A_BUCK1OUT_1V	0x5
/* Buck1 1.05 volt value */
#define S5M8767A_BUCK1OUT_1_05V    0x6
#define S5M8767A_BUCK1CTRL_EN	(3 << 0)
/* Buck2 1.3 volt value */
#define S5M8767A_BUCK2DVS1_1_3V	0x38
#define S5M8767A_BUCK2CTRL_ON	(1 << 4)
/* Buck3 1.0125 volt value */
#define S5M8767A_BUCK3DVS1_1_0125V	0x21
#define S5M8767A_BUCK3CTRL_ON	(1 << 4)
/* Buck4 1.2 volt value */
#define S5M8767A_BUCK4DVS1_1_2V	0x30
#define S5M8767A_BUCK4CTRL_ON	(1 << 4)
/* LDO2 1.5 volt value */
#define S5M8767A_LD02CTRL1_1_5V	0x1c
/* LDO3 1.8 volt value */
#define S5M8767A_LD03CTRL1_1_8V	0x14
/* LDO5 1.8 volt value */
#define S5M8767A_LD05CTRL1_1_8V	0x14
/* LDO10 1.8 volt value */
#define S5M8767A_LD10CTRL1_1_8V	0x14
/*
 * S5M8767A_REG_PMIC_32KHZ set to 32KH CP
 * output is activated
 */
#define S5M8767A_32KHCP_EN	(1 << 1)
/*
 * S5M8767A_REG_PMIC_BBAT set to
 * Back up batery charger on and
 * limit voltage setting to 3.5v
 */
#define S5M8767A_BBCHOSTEN	(1 << 0)
#define S5M8767A_BBCVS_3_5V	(3 << 3)
#endif /* __S5M8767A_PMIC_H_ */
