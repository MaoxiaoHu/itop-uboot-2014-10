/*
 * Copyright (c) 2013 Samsung Electronics Co., Ltd. All rights reserved.
 * Sanghee Kim <sh0130.kim@samsung.com>
 * Piotr Wilczek <p.wilczek@samsung.com>
 *
 * SPDX-License-Identifier:	GPL-2.0+
 */

#include <common.h>
#include <lcd.h>
#include <asm/arch/pinmux.h>
#include <asm/arch/power.h>
#include <asm/arch/mipi_dsim.h>
#include <asm/arch/board.h>
#include <power/pmic.h>
#include <power/s5m8767a_pmic.h>
#include <power/battery.h>
#include <power/max77693_pmic.h>
#include <power/max77693_muic.h>
#include <power/max77693_fg.h>
#include <libtizen.h>
#include <errno.h>
#include <i2c.h>
#include <usb.h>
#include <usb/s3c_udc.h>
#include <usb_mass_storage.h>

DECLARE_GLOBAL_DATA_PTR;

static unsigned int board_rev = -1;

static inline u32 get_model_rev(void);

static void check_hw_revision(void)
{
	int modelrev = 0;
	int i;

	/*
	 * GPM1[1:0]: MODEL_REV[1:0]
	 * Don't set as pull-none for these N/C pin.
	 * TRM say that it may cause unexcepted state and leakage current.
	 * and pull-none is only for output function.
	 */
	for (i = EXYNOS4X12_GPIO_M10; i < EXYNOS4X12_GPIO_M12; i++)
		gpio_cfg_pin(i, S5P_GPIO_INPUT);

	/* GPM1[5:2]: HW_REV[3:0] */
	for (i = EXYNOS4X12_GPIO_M12; i < EXYNOS4X12_GPIO_M16; i++) {
		gpio_cfg_pin(i, S5P_GPIO_INPUT);
		gpio_set_pull(i, S5P_GPIO_PULL_NONE);
	}

	/* GPM1[1:0]: MODEL_REV[1:0] */
	for (i = 0; i < 2; i++)
		modelrev |= (gpio_get_value(EXYNOS4X12_GPIO_M10 + i) << i);

	/* board_rev[15:8] = model */
	board_rev = modelrev << 8;
}

u32 get_board_rev(void)
{
	return board_rev;
}

static inline u32 get_model_rev(void)
{
	return (board_rev >> 8) & 0xff;
}

static void board_external_gpio_init(void)
{
	/*
	 * some pins which in alive block are connected with external pull-up
	 * but it's default setting is pull-down.
	 * if that pin set as input then that floated
	 */

	gpio_set_pull(EXYNOS4X12_GPIO_X11, S5P_GPIO_PULL_NONE);	/* HOME */
	gpio_set_pull(EXYNOS4X12_GPIO_X12, S5P_GPIO_PULL_NONE);	/* BACK */
	gpio_set_pull(EXYNOS4X12_GPIO_X33, S5P_GPIO_PULL_NONE);	/* SLEEP */
	gpio_set_pull(EXYNOS4X12_GPIO_X21, S5P_GPIO_PULL_NONE);	/* VOL_UP */
	gpio_set_pull(EXYNOS4X12_GPIO_X20, S5P_GPIO_PULL_NONE);	/* VOL_DOWN */
}

#ifdef CONFIG_SYS_I2C_INIT_BOARD
static void board_init_i2c(void)
{
	int err;
	/* I2C_1 */
	err = exynos_pinmux_config(PERIPH_ID_I2C1, PINMUX_FLAG_NONE);
	if (err) {
		debug("I2C%d not configured\n", (I2C_1));
		return;
	}

	/* I2C_1 */
	/*
    gpio_direction_output(EXYNOS4X12_GPIO_D12, 1);
	gpio_direction_output(EXYNOS4X12_GPIO_D13, 1);
    */
}
#endif

#ifdef CONFIG_SYS_I2C_SOFT
int get_soft_i2c_scl_pin(void)
{
	if (I2C_ADAP_HWNR)
		return EXYNOS4X12_GPIO_M21; /* I2C9 */
	else
		return EXYNOS4X12_GPIO_F14; /* I2C8 */
}

int get_soft_i2c_sda_pin(void)
{
	if (I2C_ADAP_HWNR)
		return EXYNOS4X12_GPIO_M20; /* I2C9 */
	else
		return EXYNOS4X12_GPIO_F15; /* I2C8 */
}
#endif

int exynos_early_init_f(void)
{
	int ret;
    board_external_gpio_init();
    ret = exynos_power_init();
    if( ret < 0 ){
		debug("%s: Cannot init exynos power.\n", __func__);
		return -1;
    }
    return 0;
}

static int pmic_init_s5m8767a(void);

int exynos_init(void)
{
	struct exynos4_power *pwr =
		(struct exynos4_power *)samsung_get_base_power();

	check_hw_revision();
	printf("HW Revision:\t0x%04x\n", board_rev);

	/*
	 * First bootloader on the TRATS2 platform uses
	 * INFORM4 and INFORM5 registers for recovery
	 *
	 * To indicate correct boot chain - those two
	 * registers must be cleared out
	 */
	writel(0, &pwr->inform4);
	writel(0, &pwr->inform5);

	return 0;
}

int exynos_power_init(void)
{
	int ret;

#ifdef CONFIG_SYS_I2C_INIT_BOARD
	board_init_i2c();
#endif
	ret = pmic_init();		/* I2C adapter 7 - bus name s3c24x0_7 */
    if( ret < 0 ){
		debug("%s: Cannot init pmic\n", __func__);
		return -1;
    }
    ret = pmic_init_s5m8767a();
    if( ret < 0 ){
		debug("%s: Cannot init pmic\n", __func__);
		return -1;
    }
	return 0;
}

#ifdef CONFIG_USB_GADGET
static int s5pc210_phy_control(int on)
{
	int ret = 0;
	unsigned int val;
	struct pmic *p, *p_pmic, *p_muic;

	p_pmic = pmic_get("MAX77686_PMIC");
	if (!p_pmic)
		return -ENODEV;

	if (pmic_probe(p_pmic))
		return -1;

	p_muic = pmic_get("MAX77693_MUIC");
	if (!p_muic)
		return -ENODEV;

	if (pmic_probe(p_muic))
		return -1;

	if (on) {
		ret = s5m8767a_set_ldo_mode(S5M8767A_I2C_ADDR, 12, OPMODE_ON);
		if (ret)
			return -1;

		p = pmic_get("MAX77693_PMIC");
		if (!p)
			return -ENODEV;

		if (pmic_probe(p))
			return -1;

		/* SAFEOUT */
		ret = pmic_reg_read(p, MAX77693_SAFEOUT, &val);
		if (ret)
			return -1;

		val |= MAX77693_ENSAFEOUT1;
		ret = pmic_reg_write(p, MAX77693_SAFEOUT, val);
		if (ret)
			return -1;

		/* PATH: USB */
		ret = pmic_reg_write(p_muic, MAX77693_MUIC_CONTROL1,
			MAX77693_MUIC_CTRL1_DN1DP2);

	} else {
		ret = s5m8767a_set_ldo_mode(S5M8767A_I2C_ADDR, 12, OPMODE_LPM);
		if (ret)
			return -1;

		/* PATH: UART */
		ret = pmic_reg_write(p_muic, MAX77693_MUIC_CONTROL1,
			MAX77693_MUIC_CTRL1_UT1UR2);
	}

	if (ret)
		return -1;

	return 0;
}

struct s3c_plat_otg_data s5pc210_otg_data = {
	.phy_control	= s5pc210_phy_control,
	.regs_phy	= EXYNOS4X12_USBPHY_BASE,
	.regs_otg	= EXYNOS4X12_USBOTG_BASE,
	.usb_phy_ctrl	= EXYNOS4X12_USBPHY_CONTROL,
	.usb_flags	= PHY0_SLEEP,
};

int board_usb_init(int index, enum usb_init_type init)
{
	debug("USB_udc_probe\n");
	return s3c_udc_probe(&s5pc210_otg_data);
}

int g_dnl_board_usb_cable_connected(void)
{
	struct pmic *muic = pmic_get("MAX77693_MUIC");
	if (!muic)
		return 0;

	return !!muic->chrg->chrg_type(muic);
}
#endif

static int pmic_init_s5m8767a(void)
{
    int ret;
	/* BUCK/LDO Output Voltage */
	ret = s5m8767a_set_ldo_voltage(S5M8767A_I2C_ADDR, 18, 3300000);	/* LDO21 VTF_2.8V */
	if (ret < 0) {
		printf("%s: pmic s5m8767a init fail.\n", __func__);
		return -1;
	}
 
    ret = s5m8767a_set_ldo_voltage(S5M8767A_I2C_ADDR, 17, 2800000);	/* LDO21 VTF_2.8V */
	if (ret < 0) {
		printf("%s: pmic s5m8767a init fail.\n", __func__);
		return -1;
	}

    ret = s5m8767a_set_buck_mode(S5M8767A_I2C_ADDR, 9, S5M8767A_BUCK_MODE_STANDBY);
    if (ret < 0) {
		printf("%s: pmic s5m8767a init fail.\n", __func__);
		return -1;
	}
    return 0;
}

/*
 * LCD
 */

#if defined CONFIG_LCD & 0
int mipi_power(void)
{
	struct pmic *p = pmic_get("MAX77686_PMIC");

	/* LDO8 VMIPI_1.0V_AP */
	s5m8767a_set_ldo_mode(p, 8, OPMODE_ON);
	/* LDO10 VMIPI_1.8V_AP */
	s5m8767a_set_ldo_mode(p, 10, OPMODE_ON);

	return 0;
}

void exynos_lcd_power_on(void)
{
	struct pmic *p = pmic_get("MAX77686_PMIC");

	/* LCD_2.2V_EN: GPC0[1] */
	gpio_set_pull(EXYNOS4X12_GPIO_C01, S5P_GPIO_PULL_UP);
	gpio_direction_output(EXYNOS4X12_GPIO_C01, 1);

	/* LDO25 VCC_3.1V_LCD */
	pmic_probe(p);
	s5m8767a_set_ldo_voltage(p, 25, 3100000);
	s5m8767a_set_ldo_mode(p, 25, OPMODE_LPM);
}

void exynos_reset_lcd(void)
{
	/* reset lcd */
	gpio_direction_output(EXYNOS4X12_GPIO_F21, 0);
	udelay(10);
	gpio_set_value(EXYNOS4X12_GPIO_F21, 1);
}

void exynos_lcd_misc_init(vidinfo_t *vid)
{
#ifdef CONFIG_TIZEN
	get_tizen_logo_info(vid);
#endif
#ifdef CONFIG_S6E8AX0
	s6e8ax0_init();
#endif
}
#else
inline int mipi_power(void){ return 0; };
#endif /* LCD */
