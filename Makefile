CC=arm-none-eabi-gcc
MACH=cortex-m33
CFLAGS= -c -g -mcpu=$(MACH) -mthumb -std=gnu11 -Wall -Iinclude -g3 -O0 -Dstatic_assert=_Static_assert -DPICO_DEFAULT_UART=0 -DPICO_DEFAULT_UART_TX_PIN=0 -DPICO_DEFAULT_UART_RX_PIN=1 -DPICO_PLATFORM=rp2350 -DPICO_BOARD=pico2
LDFLAGs= -mcpu=$(MACH) -mthumb -mfloat-abi=soft -T linker.ld -Wl,-Map=rp2350.map --specs=rdimon.specs -lc -lrdimon

# Directory for source files and object files
SRCDIR = src
INCDIR = include
OBJDIR = obj
TARGET = rp2350
LOG_FILE = build.log

############## PICO-SDK ##############
PICO_SDK_BASE_DIR := pico-sdk
PICO_SDK_SRC_DIR = $(PICO_SDK_BASE_DIR)/src

PICO_SDK_SRC_FILES += \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_uart/uart.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_clocks/clocks.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_timer/timer.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_pll/pll.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_irq/irq.c \
  $(PICO_SDK_SRC_DIR)/common/hardware_claim/claim.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_gpio/gpio.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/pico_platform_panic/panic.c \
  $(PICO_SDK_SRC_DIR)/rp2350/pico_platform/platform.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_irq/irq_handler_chain.S \
  $(PICO_SDK_SRC_DIR)/rp2_common/pico_stdio/stdio.c \
  $(PICO_SDK_SRC_DIR)/common/pico_sync/mutex.c \
  $(PICO_SDK_SRC_DIR)/common/pico_time/time.c \
  $(PICO_SDK_SRC_DIR)/common/pico_sync/lock_core.c \
  $(PICO_SDK_SRC_DIR)/rp2_common/hardware_sync/sync.c \

PICO_SDK_INC_PATHS += \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_uart/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_resets/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_clocks/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_pll/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_irq/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_gpio/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_timer/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_platform_panic/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_base/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_base_headers/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_platform_compiler/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2350/hardware_regs/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_platform_sections/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_platform_common/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2350/hardware_structs/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2350/pico_platform/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2350/hardware_regs/include/hardware/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_sync/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_sync/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_time/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/hardware_sync_spin_lock/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_runtime_init/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_runtime/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/hardware_claim/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_stdlib_headers/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_stdio/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_stdio/include/ \
  -I$(PICO_SDK_SRC_DIR)/rp2_common/pico_time_adapter/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_sync/include/ \
  -I$(PICO_SDK_SRC_DIR)/common/pico_time/include/ \
  -I$(PICO_SDK_BASE_DIR)/generated/pico_base/ \


CFLAGS += $(PICO_SDK_INC_PATHS)
############## PICO-SDK ##############


############## MCU Boot ##############
MCUBOOT_BASE_DIR := mcuboot

# Define nested paths relative to the base directory
MCUBOOT_DIR := $(MCUBOOT_BASE_DIR)/boot/bootutil
MCUBOOT_SRC_DIR := $(MCUBOOT_DIR)/src
MCUBOOT_INC_DIR := $(MCUBOOT_DIR)/include
MCUBOOT_CONFIG_DIR := /Users/bharathkammara/Desktop/rpi_pico2/baremetal/include/mcuboot_config # Needed for headers

MCUBOOT_SOURCES += \
  # $(MCUBOOT_SRC_DIR)/boot_record.c \
  # $(MCUBOOT_SRC_DIR)/bootutil_misc.c \
  # $(MCUBOOT_SRC_DIR)/caps.c \
  # $(MCUBOOT_SRC_DIR)/encrypted.c \
  # $(MCUBOOT_SRC_DIR)/fault_injection_hardening.c \
  # $(MCUBOOT_SRC_DIR)/fault_injection_hardening_delay_rng_mbedtls.c \
  # $(MCUBOOT_SRC_DIR)/image_ec.c \
  # $(MCUBOOT_SRC_DIR)/image_ec256.c \
  # $(MCUBOOT_SRC_DIR)/image_ed25519.c \
  # $(MCUBOOT_SRC_DIR)/image_rsa.c \
  # $(MCUBOOT_SRC_DIR)/image_validate.c \
  # $(MCUBOOT_SRC_DIR)/loader.c \
  # $(MCUBOOT_SRC_DIR)/swap_misc.c \
  # $(MCUBOOT_SRC_DIR)/swap_move.c \
  # $(MCUBOOT_SRC_DIR)/swap_scratch.c \
  # $(MCUBOOT_SRC_DIR)/tlv.c

# Also need mcuboot_config/ on path
MCUBOOT_INC_PATHS := -I$(MCUBOOT_INC_DIR) -I$(MCUBOOT_CONFIG_DIR) -I$(MCUBOOT_BASE_DIR)/boot/std/include -I$(MCUBOOT_BASE_DIR)/boot/bootutil/include/sysflash
CFLAGS += $(MCUBOOT_INC_PATHS)
############## MCU Boot ##############

############## TINYCRYPT #############
TINYCRYPT_DIR := $(MCUBOOT_BASE_DIR)/ext/tinycrypt/lib
TINYCRYPT_SRC_DIR := $(TINYCRYPT_DIR)/source
TINYCRYPT_INC_DIR := $(TINYCRYPT_DIR)/include

TINYCRYPT_SRC_FILES += \
  # $(TINYCRYPT_SRC_DIR)/aes_decrypt.c \
  # $(TINYCRYPT_SRC_DIR)/aes_encrypt.c \
  # $(TINYCRYPT_SRC_DIR)/cbc_mode.c \
  # $(TINYCRYPT_SRC_DIR)/ccm_mode.c \
  # $(TINYCRYPT_SRC_DIR)/cmac_mode.c \
  # $(TINYCRYPT_SRC_DIR)/ctr_mode.c \
  # $(TINYCRYPT_SRC_DIR)/ctr_prng.c \
  # $(TINYCRYPT_SRC_DIR)/hmac.c \
  # $(TINYCRYPT_SRC_DIR)/hmac_prng.c \
  # $(TINYCRYPT_SRC_DIR)/sha256.c \
  # $(TINYCRYPT_SRC_DIR)/utils.c

TINYCRYPT_INC_PATHS := -I$(TINYCRYPT_INC_DIR)

TINYCRYPT_SOURCES := $(TINYCRYPT_SRC_FILES)
CFLAGS += $(TINYCRYPT_INC_PATHS)
############## TINYCRYPT #############

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.c)
ASM_SOURCES = $(wildcard $(SRCDIR)/*.s) $(wildcard $(SRCDIR)/*.S)

##### Additional source/include files ##
#Include files
INCLUDE_PATHS := $(shell find $(INCDIR) -type d -print | sed -e 's/^/-I/')
CFLAGS += $(INCLUDE_PATHS)
##### Additional source/include files ##

# Object files (placed in OBJDIR)
C_OBJECTS = $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SOURCES))
ASM_OBJECTS = $(patsubst $(SRCDIR)/%.s,$(OBJDIR)/%.o,$(ASM_SOURCES))
MCUBOOT_OBJECTS = $(patsubst $(MCUBOOT_SRC_DIR)/%.c,$(OBJDIR)/mcuboot_%.o,$(MCUBOOT_SOURCES))
TINYCRYPT_OBJECTS = $(patsubst $(TINYCRYPT_SRC_DIR)/%.c,$(OBJDIR)/tinycrypt_%.o,$(TINYCRYPT_SOURCES))
# PICO_SDK_OBJ_FILES := $(patsubst $(PICO_SDK_SRC_DIR)/%.c,$(OBJDIR)/pico_sdk_%.o,$(PICO_SDK_SRC_FILES))
# This ensures both .c and .S files in PICO_SDK_SRC_FILES are correctly converted to .o files
PICO_SDK_C_FILES := $(filter %.c,$(PICO_SDK_SRC_FILES))
PICO_SDK_S_FILES := $(filter %.S,$(PICO_SDK_SRC_FILES))

PICO_SDK_OBJ_FILES := $(patsubst $(PICO_SDK_SRC_DIR)/%.c,$(OBJDIR)/pico_sdk_%.o,$(PICO_SDK_C_FILES))
PICO_SDK_OBJ_FILES += $(patsubst $(PICO_SDK_SRC_DIR)/%.S,$(OBJDIR)/pico_sdk_%.o,$(PICO_SDK_S_FILES))

OBJECTS = $(C_OBJECTS) $(ASM_OBJECTS) $(MCUBOOT_OBJECTS) $(TINYCRYPT_OBJECTS) $(PICO_SDK_OBJ_FILES)

all: $(PICO_SDK_BASE_DIR) $(MCUBOOT_BASE_DIR) $(TARGET) 

log_build:
	@echo "Starting build and saving output to $(LOG_FILE)..."
	@$(MAKE) all 2>&1 | tee $(LOG_FILE)

# Rule to link the executable
$(TARGET): $(OBJECTS)

	$(CC) $(LDFLAGs) $(OBJECTS) -o $@ 2>&1 | tee linker.log

# Rule to compile source files into object files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR) # Create obj directory if it doesn't exist
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile asm files into object files
$(OBJDIR)/%.o: $(SRCDIR)/%.s
	@mkdir -p $(OBJDIR) # Create obj directory if it doesn't exist
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile mcuboot files into object files
$(OBJDIR)/mcuboot_%.o: $(MCUBOOT_SRC_DIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile tinycrypt files into object files
$(OBJDIR)/tinycrypt_%.o: $(TINYCRYPT_SRC_DIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile pico-sdk files into object files
$(OBJDIR)/pico_sdk_%.o: $(PICO_SDK_SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile pico-sdk files into object files
$(OBJDIR)/pico_sdk_%.o: $(PICO_SDK_SRC_DIR)/%.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(MCUBOOT_BASE_DIR):
	git clone --recurse-submodules=. https://github.com/mcu-tools/mcuboot.git $(MCUBOOT_BASE_DIR)
	cd $(MCUBOOT_BASE_DIR) && git checkout e512181 && git submodule update --recursive

$(PICO_SDK_BASE_DIR):
  git clone --recurse-submodules=. https://github.com/raspberrypi/pico-sdk.git $(PICO_SDK_BASE_DIR)

# Clean rule to remove generated files
clean:
	rm -rf $(OBJDIR)

##############rp2350##########
flash: clean $(TARGET)
	/Users/bharathkammara/Desktop/rpi_pico2/openocd/src/openocd -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/interface/cmsis-dap.cfg -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/target/rp2350.cfg -c "adapter speed 5000" -c "program $(TARGET) verify reset exit"

debug: clean $(TARGET)
	arm-none-eabi-gdb -ex "target remote localhost:3333" -ex "monitor reset init" -ex "break Reset_Handler" -tui -ex "target extended-remote localhost:3333" -ex "layout regs" $(TARGET)

openocd-server:
	/Users/bharathkammara/Desktop/rpi_pico2/openocd/src/openocd -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/interface/cmsis-dap.cfg -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/target/rp2350.cfg -c "adapter speed 5000"

reset:
	/Users/bharathkammara/Desktop/rpi_pico2/openocd/src/openocd -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/interface/cmsis-dap.cfg -f /Users/bharathkammara/Desktop/rpi_pico2/openocd/tcl/target/rp2350.cfg -c "init; reset; exit;"

