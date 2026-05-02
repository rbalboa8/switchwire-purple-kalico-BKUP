sudo service klipper stop
cd ~/klipper

make clean KCONFIG_CONFIG=btt_skr_mini_e3_v1.2_klipper.config
make menuconfig KCONFIG_CONFIG=btt_skr_mini_e3_v1.2_klipper.config
make -j4 KCONFIG_CONFIG=btt_skr_mini_e3_v1.2_klipper.config
read -p "BTT SKR E3 Mini V1.2 firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

~/klipper/scripts/flash-sdcard.sh /dev/serial/by-id/usb-Klipper_stm32f103xe_31FFD2054246303113620557-if00 btt-skr-mini-e3-v1.2
read -p "BTT SKR E3 Mini V1.2 firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"

make clean KCONFIG_CONFIG=voron_klipper_expander_klipper.config
make menuconfig KCONFIG_CONFIG=voron_klipper_expander_klipper.config
make -j4 KCONFIG_CONFIG=voron_klipper_expander_klipper.config
read -p "Klipper Expander firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"

make -j4 KCONFIG_CONFIG=voron_klipper_expander_klipper.config flash FLASH_DEVICE=0483:df11
read -p "Klipper Expander firmware flashed, please check above for any errors. Press [Enter] to continue, or [Ctrl+C] to abort"


make clean KCONFIG_CONFIG=rpi_klipper.config
make menuconfig KCONFIG_CONFIG=rpi_klipper.config

make -j4 KCONFIG_CONFIG=rpi_klipper.config
read -p "RPi firmware built, please check above for any errors. Press [Enter] to continue flashing, or [Ctrl+C] to abort"
make flash KCONFIG_CONFIG=rpi_klipper.config

sudo service klipper start