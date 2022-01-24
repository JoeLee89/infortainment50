#!/bin/bash
#====================================================================
#                 GENERATED FILE - DONT MODIFY!!!!
#
# INPUTFILE: all_tests_manu.txt
# SYSTEM:    EBOARD_ADi_LEC1
# OS:        Linux
# DATE:      Jan-13-2022, 17:00:41
#
#====================================================================

# ===== System Information =====
# Test API : adiLibGetSystemInfo(SystemInfo* SysInfo);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SYS_Info

# Test API : adiDiGetPort(uint64_t* PortValue);
# Test API : adiDiGetPin(uint8_t BitId, bool* Value);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPI_Button

# Test API : adiDipSwitchBackplaneGetPort(uint64_t* PortValue); // BACC_DIPSWITCH 
# Test API : adiDipSwitchBackplaneGetPin(uint8_t BitId, bool* Value);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPI_User_DIP_SW

# Test API : adiDipSwitchMainboardGetPort(uint64_t* PortValue); // need to be added
# Test API : adiDipSwitchMainboardGetPin(uint8_t BitId, bool* Value); // need to be added
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPI_Mainboard_DIP_SW

# Test API : adiBaccFsGetPort(uint64_t* PortValue); // BACC_FS1_FS2 // For BACC only
# Test API : adiBaccFsGetPin(uint8_t BitId, bool* Value); // For BACC only
# Please press both FS1 and FS2 at the same time and keeping it pressed for about 1 second to pass this testing.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPI_BACC_FS

# ===== Crypto SHA =====
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Crypto_SHA




# M A N U A L   T E S T   C A S E S : 


# ===== FPGA F/W Number =====
# Test API : adiLibGetSystemInfo(SystemInfo* SysInfo);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section FPGA_FW_Number

# Asign --FPGA_FW parameter to verify 
# Please modify FPGA_FW version number on testing
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --FPGA_FW 1.18 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section FPGA_FW_Number
./idll-test --FPGA_FW 1.2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section FPGA_FW_Number

# ===== FPGA FW SHA256 verify =====
# Test API : adiLibGetFirmwareSHA256(char* Sha256String);
# Need to replace with your 64 char sha256 data manually, if there is no sha256 data, this test will not start and just return pass.
# idll-test --fpga-fw-sha256 <replace with your 64 char sha256 data here> -- --EBOARD_TYPE EBOARD_ADi_SA3X "Scenario: adiLibGetFirmwareSHA256"
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --fpga-fw-sha256 "8D022F4BEE016A60FD4EE04D925CF3E0083289248872B62A26CB91D7AD6747F0" -- --EBOARD_TYPE EBOARD_ADi_LEC1 "Scenario: adiLibGetFirmwareSHA256"


# ===== EP-FAIL =====
# Test API : ADiDLL_SetINTCallBack(void (*CallbackFunction)(uint32_t));
# Test API : ADiDLL_ClearINTCallBack(void);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section EP-FAIL


# ===== GPO with User LED function =====
# Backplane User LED
# Test API : adiUserLedBackplaneGetPort(uint64_t* PortValue);
# Test API : adiUserLedBackplaneSetPort(uint64_t PortValue);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PORT_VAL 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section User_LED_SetPort

# Backplane User LED
# Test API : adiUserLedBackplaneGetPin(uint8_t BitId, bool* Value);	
# Test API : adiUserLedBackplaneSetPin(uint8_t BitId, bool Value);	
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PIN_NUM 0 --PIN_VAL true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section User_LED_SetPin

# Mainboard User LED
# Test API : adiUserLedMainboardSetPin(uint8_t BitId, bool* Value);	
# Test API : adiUserLedMainBoardGetPin(uint8_t BitId, bool Value);	
# Test API : adiUserLedMainboardSetPort(uint64_t PortValue);
# Test API : adiUserLedMainboardSetPin(uint8_t BitId, bool Value);
./idll-test --PIN_NUM 0 --PIN_VAL true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Mainboard_User_LED_SetPin
./idll-test --PORT_VAL 15 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Mainboard_User_LED_SetPort


# ===== GPO with High Current LED function =====
# Test API : adiHcoGetPort(uint64_t* PortValue);
# Test API : adiHcoSetPort(uint64_t PortValue);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PORT_VAL 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HighCurrent_LED_SetPort
./idll-test --PIN_NUM 0 --PIN_VAL true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HighCurrent_LED_SetPin


# ===== GPO with High Current LED Brightness =====
# for LEC1
# PIN_NUM 0~2
# BRIGHTNESS 0~99 
# Test API : adiHcoSetBrightness(uint32_t BitMask, uint8_t Brightness);
# Test API : adiHcoGetBrightness(uint8_t LedId, uint8_t* Brightness);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PIN_NUM 1 --BRIGHTNESS 10 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_HCO3A_Brightness_with_parameter [ADiDLL][HCO3A][PWM][POC]


# ===== GPO with High Current LED Blinking =====
# for LEC1
# PIN_NUM 0~2
# PERIOD can be 0~65535 (blinkingPeriod=Period(ms), (0,1 means stopping blinking)), DUTY_CYCLE can be 1~99. (percentage)
# Test API : adiHcoSetLampBlink(uint64_t BitMask, uint16_t Period, uint16_t DutyCycle);
# Test API : adiHcoGetLampBlink(uint8_t BitId, uint16_t* Period, uint16_t* DutyCycle);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PIN_NUM 0 --PERIOD 10 --DUTY_CYCLE 50 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_HCO3A_PWM [ADiDLL][HCO3A][PWM][POC]


# ===== GPO with LED function =====
# Test API : adiDoGetPort(uint64_t* PortValue);
# Test API : adiDoSetPort(uint64_t PortValue);
# Test API : adiDoSetPin(uint8_t BitId, bool Value);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PORT_VAL 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED_SetPort
./idll-test --PIN_NUM 0 --PIN_VAL true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED_SetPin


# ===== GPO DO LED Blink =====
# For LEC1
# GPO with LED -- blink function. Set "--PERIOD 0" or "--PERIOD 1" to stop blinking. 
#     PERIOD can be 0~65535 (blinkingPeriod=Period*10ms, (0,1 means stopping blinking)), DUTY_CYCLE can be 1~99. (percentage)
# Test API : adiDoSetLampBlink(uint64_t BitMask, uint16_t Period, uint16_t DutyCycle);
# Test API : adiDoGetLampBlink(uint8_t BitId, uint16_t* Period, uint16_t* DutyCycle);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PIN_NUM 0 --PERIOD 50 --DUTY_CYCLE 50 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED_SetDoLedBlink


# ===== GPO DO LED Brightness =====
# For LEC1
# Test API : adiDoSetLampBrightness(uint32_t BitMask, uint8_t Brightness);
# Test API : adiDoGetLampBrightness(uint8_t LedId, uint8_t* Brightness);
# LED_NUM can be 0~31
# BRIGHTNESS can be 0~99
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
./idll-test --LED_NUM 1 --BRIGHTNESS 10 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_DO_Brightness_with_parameter [ADiDLL][DO][Brightness]


# ===== GPI Debounce Filter =====
# This debounce number is in 0.1ms unit. Setting these bits to 0x0 is equivalent to setting to 0x1
# Test API : adiDiSetDebounceFilter(uint64_t BitMask, uint16_t DebounceValue);
# Test API : adiDiGetDebounceFilter(uint8_t BitId, uint16_t* DebounceValue);
# Test API : adiDiEnableInterrupt( uint32_t *ID, void ( *CallbackFunction )( DigitalInputData* ), uint64_t Mask, bool RisingEdge, bool FallingEdge );
# Test API : adiDiDisableInterrupt( uint32_t ID );
# Because ADi-LEC1 will ignore the number that can't delived by 10 completelt, please use the number in times of 10 (10, 20, 30, ...) for DEBOUNCE
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --DEBOUNCE 500 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPI_SetDebounce

# ===== LED PCA9626 Driver =====
# Test API : adiLedSetBrightness(uint32_t BitMask, uint8_t Brightness)
# Test API : adiLedSetBlink(uint16_t Period, uint8_t DutyCycle);
# Test API : adiLedGetBlink(uint16_t* Period, uint8_t* DutyCycle);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --PIN_NUM 0 --PERIOD 1000 --DUTY_CYCLE 50 --BRIGHTNESS 50 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED_Drive_SetBlink

# ===== DI =====
# Test API : adiDiEnableInterrupt(uint32_t* ID, void (*CallbackFunction)(DigitalInputData*), uint64_t Mask, bool RisingEdge, bool FallingEdge)
# Test API : adiDiDisableInterrupt(uint32_t ID)
# --DI-Int true for Testing DI interrupt
# --DI-Mask 4294901760 (1 - 4294967295)
# --DI-Int-Rising or --DI-Int-Falling for RisingEdge trigger or FallingEdge trigger
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --DI-Int true --DI-Mask 4294901760 --DI-Int-Rising false --DI-Int-Falling true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Register_DI_Manu

# Need trigger DI Interrupt by tester)(will timeout about 30 seconds if no callback)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Trigger_DI_Interrupt


# ===== EEPROM =====
# Test API : adiEepromGetSize(uint8_t Index, uint32_t* Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --EMEM_TYPE EMEM_EEPROM1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section EEPROM_GetMemSize

# Test API : adiEepromWrite(uint8_t Index, uint32_t Address, const uint8_t* Buffer, size_t Length);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --WRITE_MEM EMEM_EEPROM1,100,0,1,2,3,4,5,6,7,8,9 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section EEPROM_Write

# Test API : adiEepromRead(uint8_t Index, uint32_t Address, uint8_t* Buffer, size_t Length);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --READ_MEM EMEM_EEPROM1,100,400 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section EEPROM_Read


# ===== External I2C=====
# Test API : adiI2cExec(uint8_t Address, const uint8_t* OutBuffer, size_t OutBufLen,uint8_t* InBuffer, size_t* InBufLen);
# Execute External I2C command: write 0x01,0x02,0x03 to address 0x00,0x00 to device at slave address 0x50
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --SLAVE_ADDR 0x50 --I2C_CMD 0x00,0x00,0x01,0x02,0x03 --RESP_LEN 0  -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Ext_I2C_EXEC

# Execute External I2C command: read 3 bytes data from address 0x00,0x00 of device at slave address 0x50
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --SLAVE_ADDR 0x50 --I2C_CMD 0x00,0x00 --RESP_LEN 3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Ext_I2C_EXEC


# ===== Execute External SPI =====
# Test API : adiSpiInit(ESPI_BUS Bus, uint8_t Mode);
# Test API : adiSpiExec(ESPI_BUS Bus, uint8_t* OutBuffer, size_t OutBufLen, uint8_t* InBuffer, size_t InBufLen);
# Execute External SPI -- RDID
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --SPI_MODE 0 --SPI_CMD 0x9F --RESP_LEN 3  -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Ext_SPI_EXEC

# Execute External SPI -- REMS
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --SPI_MODE 0 --SPI_CMD 0x90,0x00,0x00,0x00 --RESP_LEN 2  -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Ext_SPI_EXEC


# ===== Hard Meter =====
# Test API : adiDoSetPin(uint8_t BitId, bool Value);
# Test API : adiHardMeterSenseGetPort(uint64_t* PortValue);
# Test API : adiHardMeterSenseGetPin(uint8_t BitId, bool* Value);
# Check if the hardmeter is connected to Hardmeter Sense Pin 0 and Out Pin 24
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --DO_PIN_NUM 24 --MSENSE_PIN_NUM 0  -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_BACC_SetPin

# ===== Mard Meter =====
# Test API : adiHardMeterOutSetPort(uint64_t PortValue);
# Test API : adiHardMeterOutSetPin(uint8_t BitId, bool Value);
# Test API : adiHardMeterSenseGetPort(uint64_t* PortValue);
# Test API : adiHardMeterSenseGetPin(uint8_t BitId, bool* Value);
# Desc     : If not have 8 hard meters, assign --PORT_VAL as which pins your hard meter(s) connect to. (from 0x01~0xFF). Format: --PORT_VAL <decimal/hex number>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PORT_VAL 0x01 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter

# ===== Mard Meter(By Port, multi-hard meter) =====
# Test API : adiHardMeterOutSetPort(uint64_t PortValue);
# Test API : adiHardMeterOutGetPort(uint64_t *PortValue);
# Test API : adiHardMeterSenseGetPort(uint64_t &PortValue);
# Desc     : --PORT_VAL 0x1FF is the External HM (x9), 0xFE00 is the Internal HM (x7), 0xFFFF is all HM (x16)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PORT_VAL 0xFF --HM-Int-Count 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_ByPort

# ===== Mard Meter(By Pin) =====
# Test API : adiHardMeterOutSetPin(uint8_t BitId, bool Value);
# Test API : adiHardMeterOutGetPin(uint8_t BitId, bool *Value);
# Test API : adiHardMeterSenseGetPin(uint8_t BitId, bool *Value);
# Desc     : --PIN_VAL 0x0-0xa is the External HM (x9), 0xb-0xf  is the Internal HM (x7)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --PIN_VAL 0x0 --HM-Int-Count 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_ByPin


# ===== SEC Meter (No Reset command available) =====
# Test API : adiSecShowText(const char* Text, size_t TextLen);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sec-display-text adlink -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_Display

# Test API : adiSecSetCounterText(uint8_t CounterId, const char* Text, size_t TextLen);
# Test API : adiSecShowCounterText(uint8_t CounterId);
# Test case SecMeter_SetCounterText: Argument, both of '--sec-display-text' and '--sec-counter-id' are optional.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_SetCounterText

# --sec-display-text : max to 7 chars
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 3 --sec-display-text 8862 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_SetCounterText

# --sec-counter-id : 0~31
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 3 --sec-counter-id 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_SetCounterText

# Test case SecMeter: All arguments are optional and can be mix together.
# --sec-counter-id : 0~31
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sec-counter-id 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter

# Test API : adiSecShowCounterValue(uint8_t CounterId);
# Test API :  EERROR IDLL_API adiSecIncrementCounterValue(uint8_t CounterId, uint16_t IncrementValue);
# --sec-increment-value : 1~65535 (do not accept negative value, will be ignored) (any value greater than 0xFFFF will be convert to uint16_t automatically)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sec-increment-value 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter


# ===== SRAM =====
# The 'no mirror mode' on FPGA platform change to 1 'no mirror mode'
# Test API : adiSramRead(uint32_t Address, uint8_t* Buffer, size_t Length);
# Test API : adiSramWrite(uint32_t Address, const uint8_t* Buffer, size_t Length);
# Test API : adiSramGetMirrorMode(ESRAM_MIRROR_MODE* MirrorMode);
# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode);
# --sram-write <mirror mode>:<start address>:<data 1>/<data 2>/<data N>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sram-write 1:100:255/255/255 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Manual_write

# --sram-read <mirror mode>:<start address>:<read length>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sram-read 1:100:3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Manual_read

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramBankCopy( uint32_t Address, uint32_t Length, uint32_t SourceBank, uint32_t DestinationBank)
# Parameter can be Hex or Decimal format
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x800 --SOURCE_BANK 0x0 --DEST_BANK 0x1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramBankCopyManual

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ))
# Test API : adiSramAsyncBankCopy( uint32_t Address, uint32_t Length, uint32_t SourceBank, uint32_t DestinationBank)
# Parameter can be Hex or Decimal format
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x800 --SOURCE_BANK 0x0 --DEST_BANK 0x1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramAsyncBankCopyManual

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramBankCompare( uint32_t SourceBank, uint32_t DestinationBank, uint32_t Address, uint32_t Length, uint32_t *ErrorAddress)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --SOURCE_BANK 0x0 --DEST_BANK 0x1 --ADDRESS 0x0 --LENGTH 0x800 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramBankCompareManual

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ))
# Test API : adiSramAsyncBankCompare( uint32_t SourceBank, uint32_t DestinationBank, uint32_t Address, uint32_t Length)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --SOURCE_BANK 0x0 --DEST_BANK 0x1 --ADDRESS 0x0 --LENGTH 0x800 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramAsyncBankCompareManual

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramCalculateCRC32( uint32_t StartAddress, uint32_t Length, uint32_t *CRC32)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x800 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramCalculateCRC32Manual

# Test API : adiSramSetMirrorMode(ESRAM_MIRROR_MODE MirrorMode)
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ))
# Test API : adiSramAsyncCalculateCRC32( uint32_t StartAddress, uint32_t Length)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x800 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramAsyncCalculateCRC32Manual

# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramWriteWithVerify( uint32_t SRAMAddress, uint32_t SRAMAccessLength, uint8_t *MainMemoryAddress, uint32_t *ErrorAddress )
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x100 --SRAM-DATA-FILE="c:/temp/data.txt" -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramWriteWithVerifyManual

# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size)
# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ))
# Test API : adiSramAsyncWriteWithVerify( uint32_t SRAMAddress, uint32_t SRAMAccessLength, uint8_t *MainMemoryAddress )
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --ADDRESS 0x0 --LENGTH 0x100 --SRAM-DATA-FILE="c:/temp/data.txt" -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SramAsyncWriteWithVerifyManual


# ===== PIC =====
# Test API : adiWatchdogSetTimeout(uint16_t Seconds);
# Test API : adiWatchdogSetSystemRestart(bool SystemRestartWhenTimeOut);
# Test API : adiWatchdogGetSystemRestart(bool* SystemRestartWhenTimeOut);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Watchdog
./idll-test --watchdog 5 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Watchdog
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiWatchdogSetSystemRestart

# Test API : adiEventGet(Event* Event);
# Test API : adiEventGetWithFilter(Event* Event, uint8_t EventCode, uint8_t EventStatus, uint8_t EventIndex);
# Test API : adiBatGenerateEvent(void);
# Test API : adiBatGetVoltages(Batteries* Batteries);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Battery_PICEventByType

# Test API : adiBatGetWarningVoltage(Batteries* Voltages)
# Test API : adiBatSetWarningVoltage(const Batteries* Voltages)
# Test API : adiLibGetErrorString(EERROR Code, char* ErrorString, size_t Length)
# --pic-batteries-voltage: "28" means 2.8v. When assign "0", the index of battery will get NO further warning event.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --pic-batteries-voltage "28,25,22" -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section BatSetGetWarningVoltageManual [PIC][BATTERY][MANU]


# Test API : adiBatGetLowVoltage(Batteries* Voltages)
# Test API : adiBatSetLowVoltage(const Batteries* Voltages)
# Test API : adiLibGetErrorString(EERROR Code, char* ErrorString, size_t Length)
# --pic-batteries-voltage: "28" means 2.8v. When assign "0", the index of battery will get NO further warning event.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --pic-batteries-voltage "10,11,12" -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section BatSetGetLowVoltageManual [PIC][BATTERY][MANU]


# Test API : adiEnableBatteryWarnEvent(uint8_t interval, uint16_t pinMask, void (*CallbackFunction)(const Event PicEvent, uint16_t triggeredPinMask))
# Test API : adiBatGenerateEvent(void)
# Test API : adiDisableBatteryWarnEvent(uint16_t pinMask)
# Parameter: INTERVAL unit is minute
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --INTERVAL 1 --PIN_MASK 0x03 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_BatWarn_Manual [CALLBACK][PIC][MANU]


# Test API : adiEnableBatteryLowEvent(uint8_t interval, uint16_t pinMask, void (*CallbackFunction)(const Event PicEvent, uint16_t triggeredPinMask))
# Test API : adiBatGenerateEvent(void)
# Test API : adiDisableBatteryLowEvent(uint16_t pinMask)
# Parameter: INTERVAL unit is minute
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --INTERVAL 1 --PIN_MASK 0x03 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_BatLow_Manual [CALLBACK][PIC][MANU]

# Test API: adiEventGet(Event* Event)
# Test API: adiWatchdogSetSystemRestart(bool SystemRestartWhenTimeOut)
# Test API: adiWatchdogGetSystemRestart(bool* SystemRestartWhenTimeOut)
# Test API: adiWatchdogSetTimeout(uint16_t Seconds)
# Test API: adiEnableWatchdogTimeoutEvent(void (*CallbackFunction)(const Event wdEvent))
# Test API: adiDisableWatchdogTimeoutEvent(void)
# This is the manual version of "Callback_PIC_WDTimeout_Auto"
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --WATCHDOG_TIMEOUT 2 --SYSTEM_RESTART false -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_WDTimeout_Manual [CALLBACK][PIC][MANU]
# idll-test --WATCHDOG_TIMEOUT 2 --SYSTEM_RESTART true -- --EBOARD_TYPE EBOARD_ADi_SYSTEM --section Callback_PIC_WDTimeout_Manual [CALLBACK][PIC][MANU]

# Test API: adiEventGet(Event* Event)
# Test API: adiWatchdogSetTimeout(uint16_t Seconds)
# Test API: adiEnableWatchdogTimeoutEvent(void (*CallbackFunction)(const Event wdEvent))
# Test API: adiDisableWatchdogTimeoutEvent(void)
# This is the manual version of "Callback_PIC_WDTimeout_Auto"
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --WATCHDOG_TIMEOUT 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_WDTimeout_Manual [CALLBACK][PIC][MANU]

# Test API : adi1wireSearchAllDevices(uint8_t* DevicesCount);
# Test API : adi1wireGetUniqueId(uint8_t Index, char* Buffer, size_t Length);
# Test API : adi1wireEepromRead(uint8_t Index, uint32_t Address, uint8_t* Buffer, size_t Length);
# Test API : adi1wireEepromWrite(uint8_t Index, uint32_t Address, const uint8_t* Buffer, size_t Length);
# Test API : adi1wireEepromGetSize(uint8_t Index, uint32_t* Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --dallas-eeprom-read 0:100:3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_1Wire_EEPROM_Manual_read
./idll-test --dallas-eeprom-write 0:100:255/255/255 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_1Wire_EEPROM_Manual_write

# Test API : adiIntrusionGetPort(uint64_t* PortValue);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Intrusion_ports
./idll-test --interlock 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Interlock_Test

# Test API : adiEventGet(Event* Event);
# Test API : adiEventGetWithFilter(Event* Event, uint8_t EventCode, uint8_t EventStatus, uint8_t EventIndex);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_GetPICEvent_and_DisplayEventTime

# Test API : adiEventGetWithFilter(Event* Event, uint8_t EventCode, uint8_t EventStatus, uint8_t EventIndex);
# Check user manual to know the event typ, event status and event index.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --EVENT_TYPE EPIC_EVENT_ANY --EVENT_STATUS EPIC_STATUS_FROM_NEWEST_ANY --EVENT_INDEX 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_adiEventGetWithFilter_Manu [ADiDLL][PIC]

# Test API : adiEventGet(Event* Event);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --external-sw 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_External_Function_SW_Test

# RD Test
# -- PIC Reset -- Execute these 4 test case, one by one
# idll-test --pic-reset-test 1 -- --EBOARD_TYPE EBOARD_ADi_SC1X --section PIC_RESET_BEFORE
# pause
# start /B /wait FPGA_SetL 0xA40 0x01
# pause
# start /B /wait FPGA_SetL 0xA40 0x00
# pause
# idll-test --pic-reset-test 1 -- --EBOARD_TYPE EBOARD_ADi_SC1X --section PIC_RESET_AFTER


# ===== PIC Callback =====
# Test API : adiEnableIntrusionEvent(INTERLOCK_EVENT_TRIGGER interlockEvent, uint16_t pinMask, void (*CallbackFunction)(INTERLOCK_STATE interlockState, uint16_t pinMask));
# Test API : adiDisableIntrusionEvent(uint16_t pinMask);
# --pic-cb-intr-pinmask: 0000 0001 to 1111 1111; --pic-cb-intr-event: OPEN, CLOSE, OPEN_OR_CLOSE; User judget for PASS/FAIL
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --pic-cb-intr-pinmask 255 --pic-cb-intr-event OPEN -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_Intrusion_Manu [CALLBACK][PIC][MANU]

# Register 6 pin to listen OPEN or CLOSE interlock event. Display event. User judget for PASS/FAIL
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_Intrusion_AllPinAllEvent_Manu [CALLBACK][PIC][MANU]

# Callback_PIC_RtcAlarm_Manual
#   --rtc-alarm-conf 0: Only generate Event
# 	 --rtc-alarm-conf 1: Generate Event then push Power button (on or off)
#   --pic-alarm_seconds: Alarm time will be current time + "--pic-alarm_seconds" seconds.
# User judge for PASS / FAIL
# Test API : adiEnableRtcAlarmEvent(const Time* alarmTime, void (*CallbackFunction)(const Event wdEvent));
# Test API : adiDisableRtcAlarmEvent(void);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --rtc-alarm-conf 0 --pic-alarm_seconds 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_RtcAlarm_Manual [CALLBACK][PIC][MANU]
# ./idll-test --rtc-alarm-conf 1 --pic-alarm_seconds 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_RtcAlarm_Manual [CALLBACK][PIC][MANU]


# ===== PIC Get curent Alarm configuration =====
# Test API : adiRtcGetAlarmConfig(EPIC_ALARM_CONF* conf);
# Test API : adiRtcGetAlarm(Time* alarmTime);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_CONF_GET_manual [PIC][RTC][ALARM][MANUAL]

# Test API : adiRtcSetAlarmConfig(const EPIC_ALARM_CONF conf);
# PIC Set Alarm configuration "--rtc-alarm-conf 0" for generate event only, "--rtc-alarm-conf 1" for generate event then power on/off (push power button)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --rtc-alarm-conf 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_CONF_SET_manual [PIC][RTC][ALARM][MANUAL]

# Test API : adiRtcGetTime(Time* Time);
# Test API : adiRtcSetAlarm(const Time* alarmTime);
# PIC Set Alarm manual, the new Alarm time will be ala--pic-alarm_seconds add current RTC Time
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --pic-alarm_seconds 30 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_SET_manual [PIC][RTC][ALARM][MANUAL]

# Get current Alarm time
# Test API : adiRtcGetAlarm(Time* alarmTime);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_GET_manual [PIC][RTC][ALARM][MANUAL]


# ===== LED Strip (Connect LED Strip to ExtSPI) =====
# Test API : adiSpiInit(ESPI_BUS Bus, uint8_t Mode);
# Test API : adiSpiExec(ESPI_BUS Bus, uint8_t* OutBuffer, size_t OutBufLen, uint8_t* InBuffer, size_t InBufLen);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --LOOP 5 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LED_Strip [LED_Strip][MANUAL]
# ./idll-test --LOOP 10 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LED_Strip_Random [LED_Strip][MANUAL]

# ===== SerialPort =====
# The two SerialPorts must be connected with a nullmodem-cable!
# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle);
# Test API : adiSerialClose(SerialHandle* Handle);
# Test API : adiSerialWrite(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumWritten);
# Test API : adiSerialMdbWrite(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumWritten);
# Test API : adiSerialRead(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumRead);
# Test API : adiSerialMdbRead(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumRead, bool* WakeBit);
# --serial-port1 <SerialPort-Name> --serial-port2 <SerialPort-Name>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --serial-port1 COM1 --serial-port2 COM2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_Nullmodem
# ./idll-test --serial-port1 /dev/ttyS5 --serial-port2 /dev/ttyS6 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_Nullmodem
./idll-test --serial-port1 LEC1_COM1 --serial-port2 LEC1_COM2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_Nullmodem

# 9-data-bit test for MDB functions
# --serial-port1 <SerialPort-Name> --serial-port2 <SerialPort-Name>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --serial-port1 COM1 --serial-port2 COM2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_MDB_Nullmodem
./idll-test --serial-port1 /dev/ttyS5 --serial-port2 /dev/ttyS6 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_MDB_Nullmodem

# ===== SerialPort Timings Config =====
# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle);
# Test API : adiSerialClose(SerialHandle* Handle);
# Test API : adiSerialGetTimeouts(SerialHandle Handle, SerialPortTimeouts* timeouts);
# Test API : adiSerialSetTimeouts(SerialHandle Handle, SerialPortTimeouts timeouts);
# --serial-port1 <SerialPort-Name>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --serial-port1 COM1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_Config
./idll-test --serial-port1 /dev/ttyS5 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_Config


# ===== SerialPort_RW =====
# The test section will send data via serial-port1 TX and read data via serial-port2 TX and check data.
# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle)
# Test API : adiSerialClose(SerialHandle* Handle)
# Test API : adiSerialWrite(SerialHandle Handle, uint8_t* Buffer, size_t Length, size_t* NumWritten)
# Test API : adiSerialRead(SerialHandle Handle, uint8_t* Buffer, size_t Length, size_t* NumRead)
# Test API : adiSerialGetTimeouts(SerialHandle Handle, SerialPortTimeouts* Timeouts);
# Test API : adiSerialSetTimeouts(SerialHandle Handle, SerialPortTimeouts Timeouts);
# Parameter:
#	serial-port1 	: The first Serial COM(ex.LEC1_COM1)
#	serial-port2	: The second Serial COM(ex.LEC1_COM2)
#	BAUDRATE		: 9600 / 14400 / 19200 / 38400 / 57600 / 1155200 / 128000...
#	DATABIT			: 1 : DATABIT_5 / 2 : DATABIT_6 / 3 : DATABIT_7 / 4 : DATABIT_8
#	FLOWCTRL		: 1 : FLOWCTRL_NONE / 2 : FLOWCTRL_HW
#	PARITYBIT		: 1 : PARITY_NONE / 2 : PARITY_EVEN / 3 : PARITY_ODD / 4 : PARITY_MARK / 5 : PARITY_SPACE
#	STOPBIT			: 1 : STOPBIT_ONE / 2 : STOPBIT_TWO
#	SERIAL_WRITE	: Data to Write
#	READ_LEN		: Length to read
#	LOOP			: SIZE_MAX = To test overnight, user may assign LOOP to <18446744073709551615>.Default : 1
#	READ_INTERVAL	: unsigned int, to sleep before serial read, in milliseconds.Default : 100
#	RIT				: ReadIntervalTimeout(ms)
#	RTTC			: ReadTotalTimeoutConstant(ms)
#	RTM				: ReadTotalTimeoutMultiplier(ms)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# Normal Serial RW
./idll-test --serial-port1 LEC1_COM1 --serial-port2 LEC1_COM2 --BAUDRATE 115200 --DATABIT 4 --FLOWCTRL 1 --PARITYBIT 1 --STOPBIT 1 --SERIAL_WRITE 0123456789 --READ_LEN 10 --LOOP 1 --READ_INTERVAL 100 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_RW
#Set Serial Timeouts(with Normal Serial RW)
./idll-test --serial-port1 LEC1_COM1 --serial-port2 LEC1_COM2 --RIT 100 --RTTC 100 --RTM 10 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_RW

# ===== SerialPort_SpeedTest =====
# The test section will send data via serial-port1 TX and read data via serial-port2 TX and check data.
# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle)
# Test API : adiSerialClose(SerialHandle* Handle)
# Test API : adiSerialWrite(SerialHandle Handle, uint8_t* Buffer, size_t Length, size_t* NumWritten)
# Test API : adiSerialRead(SerialHandle Handle, uint8_t* Buffer, size_t Length, size_t* NumRead)
# Parameter:
# 	serial-port1 	: The first Serial COM(ex.LEC1_COM1)
# 	serial-port2 	: The second Serial COM(ex.LEC1_COM2)
# 	BAUDRATE		: 9600 / 14400 / 19200 / 38400 / 57600 / 1155200 / 128000...
#	READ_LEN		: Length of data in test (MAX:1024).Default : 10
#	LOOP			: SIZE_MAX = To test overnight, user may assign LOOP to <18446744073709551615>.Default : 1
#	READ_INTERVAL	: unsigned int, to Delay before sending and receiving data, in milliseconds.Default : 100 
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# SerialPort_SpeedTest (one COM loopback)
./idll-test --serial-port1 LEC1_COM1 --serial-port2 LEC1_COM1 --BAUDRATE 115200 --READ_LEN 300 --LOOP 100 --READ_INTERVAL 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_SpeedTest
# SerialPort_SpeedTest (two COMs loopback) 
./idll-test --serial-port1 LEC1_COM1 --serial-port2 LEC1_COM2 --BAUDRATE 115200 --READ_LEN 300 --LOOP 100 --READ_INTERVAL 0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_SpeedTest


# ===== GPIO =====
# Test API : None
# SA3X
# GPO Control Flow:
# Ex: If we want to set GPO DO channel0 and channel2 high and others low
# 1. Write(0x250,0x5)
#    Write DO Data Set bit0 and bit2 for ch0 and ch2
# 2. Check 0x254 until DO Updating Flag goes down to 0.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# FPGA_SetL.exe 0x250 0x5
# timeout 1
# FPGA_GetL.exe 0x250