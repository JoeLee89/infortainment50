#====================================================================
#                 GENERATED FILE - DONT MODIFY!!!!
#
# INPUTFILE: all_tests_auto.txt
# SYSTEM:    EBOARD_ADi_LEC1
# OS:        Windows
# DATE:      Jan-19-2022, 10:44:29
#
#====================================================================
# ===== General =====
# Test API : adiLibGetErrorString(EERROR Code, char* ErrorString, size_t Length);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Error_String_Message

# Test API : adiLibInit(EBOARD_TYPE BoardType);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiLibInit


# Test API : adiLibGetSystemInfo(SystemInfo* SysInfo);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SYS_Info


# ===== User LED =====
# Test API : adiUserLedBackplaneGetPort(uint64_t* PortValue); 			// EBOARD_ADi_BSEC_BACC or EBOARD_ADi_BSEC
# Test API : adiUserLedBackplaneGetPin(uint8_t BitId, bool* Value);	// EBOARD_ADi_BSEC_BACC or EBOARD_ADi_BSEC
# Test API : adiUserLedBackplaneSetPort(uint64_t PortValue);			// EBOARD_ADi_BSEC_BACC or EBOARD_ADi_BSEC
# Test API : adiUserLedBackplaneSetPin(uint8_t BitId, bool Value);		// EBOARD_ADi_BSEC_BACC or EBOARD_ADi_BSEC
# Test API : adiUserLedMainboardGetPort(uint64_t* PortValue);			// EBOARD_ADi_BSEC_BACC
# Test API : adiUserLedMainboardGetPin(uint8_t BitId, bool* Value);	// EBOARD_ADi_BSEC_BACC
# Test API : adiUserLedMainboardSetPort(uint64_t PortValue);			// EBOARD_ADi_BSEC_BACC
# Test API : adiUserLedMainboardSetPin(uint8_t BitId, bool Value);		// EBOARD_ADi_BSEC_BACC
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section User_LED


# ===== HighCurrent_LED =====
# Test API : adiHcoGetPort(uint64_t* PortValue);
# Test API : adiHcoGetPin(uint8_t BitId, bool* Value);
# Test API : adiHcoSetPort(uint64_t PortValue);
# Test API : adiHcoSetPin(uint8_t BitId, bool Value);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HighCurrent_LED

# Test API : adiHcoSetBrightness(uint32_t BitMask, uint8_t Brightness);
# Test API : adiHcoGetBrightness(uint8_t LedId, uint8_t* Brightness);
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_HCO3A_Brightness [ADiDLL][HCO3A][PWM][POC]

# ===== DIO =====
# Test API : adiDoGetPort(uint64_t* PortValue);
# Test API : adiDoGetPin(uint8_t BitId, bool* Value);
# Test API : adiDoSetPort(uint64_t PortValue);
# Test API : adiDoSetPin(uint8_t BitId, bool Value);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED

# Test API : adiDoSetLampBlink(uint64_t BitMask, uint16_t Period, uint16_t DutyCycle);
# Test API : adiDoGetLampBlink(uint8_t BitId, uint16_t* Period, uint16_t* DutyCycle);
# Test API : adiDoSetLampBrightness(uint32_t BitMask, uint8_t Brightness);
# Test API : adiDoGetLampBrightness(uint8_t LedId, uint8_t* Brightness); 
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_DO_Brightness [ADiDLL][DO][Brightness]


# Test API : adiDiEnableInterrupt(uint32_t* ID, void (*CallbackFunction)(DigitalInputData*), uint64_t Mask, bool RisingEdge, bool FallingEdge)
# Test API : adiDiDisableInterrupt(uint32_t ID)
# Enabling Register DI interrupt for all pins and disabling it and check the reture value.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# dll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Register_DI


# ===== LED PCA9626 Driver =====
# Test API : adiLedSetBrightness(uint32_t BitMask, uint8_t Brightness)
# Test API : adiLedGetBrightness(uint8_t LedId, uint8_t* Brightness)
# Test API : adiLedSetBlink(uint8_t Blink, uint8_t DutyCycle)
# Test API : adiLedGetBlink(uint8_t* Blink, uint8_t* DutyCycle)
# Test API : adiLedSetPort(uint64_t PortValue)
# Test API : adiLedGetPort(uint64_t *PortValue)
# Test API : adiLedSetPin(uint8_t BitId, bool Value)
# Test API : adiLedGetPin(uint8_t BitId, bool *Value)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section GPO_LED_Drive


# ===== EEPROM =====
# Test API : adiEepromRead(uint8_t Index, uint32_t Address, uint8_t* Buffer, size_t Length);
# Test API : adiEepromWrite(uint8_t Index, uint32_t Address, const uint8_t* Buffer, size_t Length);
# Test API : adiEepromGetSize(uint8_t Index, uint32_t* Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section EEPROM_Auto


# ===== Ext I2C =====
# Please make sure the slave address of EEPROM on the external I2C is 0x50.
# Test API : adiI2cExec(uint8_t Address, const uint8_t* OutBuffer, size_t OutBufLen, uint8_t* InBuffer, size_t* InBufLen);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --LOOP 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section ExtI2C


# ===== Ext SPI =====
# Test API : adiSpiInit(ESPI_BUS Bus, uint8_t Mode);
# Test API : adiSpiExec(ESPI_BUS Bus, uint8_t* OutBuffer, size_t OutBufLen, uint8_t* InBuffer, size_t InBufLen);
# Apply optional arguments --RDID <Hex 3 bytes> and --REMS <Hex 2 bytes> to verify readed data. (ex: --RDID C22018 --REMS C217)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Ext_SPI_RDID_REMS


# ===== Crypto =====
# Test API : adiCryptoGetSerial(char* Buffer, size_t Length);
# Test API : adiCryptoSendCmd(uint8_t Address, uint8_t Command, uint8_t* Buffer, size_t* DataLen, size_t BufferLen);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Crypto
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Crypto_AES


# ===== Hard Meter =====
# Test API : adiDoSetPort(uint64_t PortValue); // not support yet in 3.x (use adiDoSetPort)
# Test API : adiDoSetPin(uint8_t BitId, bool Value); // not support yet in 3.x (use adiDoSetPin)

# Test API : adiHardMeterSenseGetPort(uint64_t* PortValue);
# The test HardMeter_BACC_SetPort expects the (max 8) hardmeters connected to Hardmeter Pin 0-7 and Out Pin 24-31!
# To test all 8 hardmeters set PORT_VAL to 255 (0xFF)
# If PORT_VAL is set to 1, it will use DO 24 (to HM GND) and HMSENSE (to HM 12V)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#./idll-test --PORT_VAL 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_BACC_SetPort

# ===== Hard Meter =====
# Test API : adiHardMeterOutSetPort(uint64_t PortValue);
# Test API : adiHardMeterOutSetPin(uint8_t BitId, bool Value);
# Test API : adiHardMeterSenseGetPort(uint64_t* PortValue);
# Test API : adiHardMeterSenseGetPin(uint8_t BitId, bool* Value);
# Desc     : If not have 8 hard meters, assign --PORT_VAL as which pins your hard meter(s) connect to. (from 0x01~0xFF). Format: --PORT_VAL <decimal/hex number>
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter

# Test API : adiHardMeterDetectionPort(uint64_t* Status)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_Detection_ByPort

# Test API : adiHardMeterDetectionPin(uint8_t BitId, bool* Status)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --HM_PIN_ID 0x0 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_Detection_ByPin

# Test API : adiHardMeterDetectionPort(uint64_t* Status);
# Test API : adiHardMeterDetectionPin(uint8_t BitId, bool* Status);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section HardMeter_Detect [ADiDLL][HardMeter][Detect]


# ===== SecMeter =====
# Test API : adiSecShowCounterValue(uint8_t CounterId);
# Test API : adiSecIncrementCounterValue(uint8_t CounterId, uint16_t IncrementValue);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --LOOP 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter

# Test API : adiSecSelfTest(ESEC_ERROR* errorCode);
# Test API : adiSecRequestStatus(uint8_t *statusByte);
# Test API : adiSecRequestMarketType(uint8_t *marketType);
# Test API : adiSecRequestVersion(char* textBuffer, size_t textBufLen);
# Test API : adiSecRequestFingerPrint(uint32_t *fingerPrint);
# Test API : adiSecRequestLastError(ESEC_ERROR* errorCode);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_New

# Write a bit-pattern to the display of the Sec-Meter. 
# The pattern written to the dispaly will be 1,2,3,4,5,6,7 for the 7 digits of the display
# Test API : adiSecShowBitPattern(uint8_t* pattern, size_t patternSize);
# Desc		: To specify the pattern specify it by max 7 values. E.g. --sec-pattern 1,2,3,4,5,6,7
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sec-pattern 1,2,3,4,5,6,7 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_BitPattern

# Test API : adiSecSetNumCounters(uint8_t numCounters);
# Test API : adiSecCycleCounterDisplay(bool startOrStop);
# sec-counter-num : The counter of channel in cycle display, it must be >= 1 and <= 31 (show counter text(1s) + counter value(3s) three times for each channel)
# sec-reserve-time : The resvered time in ms for the secmeter to show the cycle display (3 * 4000 * sec-counter-num + 1000 by dedault) 
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --sec-counter-num 3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SecMeter_Cycle


# ===== PIC =====
# Test API : adiLibGetSystemInfo(SystemInfo* SysInfo);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_Firmware_Version

# Add "-s" will display success test case message ==
# Test API : adiRtcCalibrate(int8_t Value);
# Test API : adiRtcGetTime(Time* Time);
# Test API : adiRtcSetTime(const Time* Time);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --pic-time 2019/04/13/01/02/03 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC

# Move PIC_RTC(without assigned date time) after PIC_RTC(WITH assigned date time) to prevent Day Light Saving problem with different 'time zone'.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_GETCLOCK
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC

# Test API : adiRtcCalibrate(int8_t Value)
# Due to restrict of argument parser, use the format of "--RTC-CAL-VALUE=<value>" to pass possible negative value.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --RTC-CAL-VALUE=13 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section RtcCalibrateManual
./idll-test --RTC-CAL-VALUE=-13 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section RtcCalibrateManual

# Test API : adi1wireSearchAllDevices(uint8_t* DevicesCount);
# Test API : adi1wireGetUniqueId(uint8_t Index, char* Buffer, size_t Length);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_1Wire_IDs

# Test API : adi1wireEepromRead(uint8_t Index, uint32_t Address, uint8_t* Buffer, size_t Length);
# Test API : adi1wireEepromWrite(uint8_t Index, uint32_t Address, const uint8_t* Buffer,size_t Length);
# Test API : adi1wireEepromGetSize(uint8_t Index, uint32_t* Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_1Wire_EEPROM_Same_Pattern_0xA5
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_1Wire_EEPROM_Random_Pattern

# Test API : adiBatGenerateEvent(void);
# Test API : adiBatSetWarningVoltage(const Batteries* Voltages);
# Test API : adiBatGetWarningVoltage(Batteries* Voltages);
# Test API : adiBatSetLowVoltage(const Batteries* Voltages);
# Test API : adiBatGetLowVoltage(Batteries* Voltages);
# Test API : adiBatGetVoltages(Batteries* Batteries);
# Test API : adiEnableBatteryWarnEvent(uint8_t interval, uint16_t pinMask, void (*CallbackFunction)(const Event PicEvent, uint16_t triggeredPinMask));
# Test API : adiDisableBatteryWarnEvent(uint16_t pinMask);
# Test API : adiEnableBatteryLowEvent(uint8_t interval, uint16_t pinMask, void (*CallbackFunction)(const Event PicEvent, uint16_t triggeredPinMask));
# Test API : adiDisableBatteryLowEvent(uint16_t pinMask);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_GetPICEvent_and_CheckPICBatteryVoltage

# [CALLBACK][PIC][UNITTEST] will run all callback of pic unit test
# PIC Callback Add, duplicate add, remove every intrusion pin and event.
# PIC Callback Event queue full.
# Test API : adiEnableQueueFullEvent(void (*CallbackFunction)(uint8_t eventCount));
# Test API : adiDisableQueueFullEvent(void);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_Intrusion_Auto [CALLBACK][PIC][UNITTEST]

# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_EventQueueFull_Auto [CALLBACK][PIC][UNITTEST]

# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_WDTimeout_Auto [CALLBACK][PIC][UNITTEST]

# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_RtcAlarm_Auto [CALLBACK][PIC][UNITTEST]

# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_BatWarn_Auto [CALLBACK][PIC][UNITTEST]

# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section Callback_PIC_BatLow_Auto [CALLBACK][PIC][UNITTEST]

# Battery warning
# Test API : adiBatSetWarningVoltage(const Batteries* Voltages);
# Test API : adiBatGetWarningVoltage(Batteries* Voltages);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 "Scenario: adiBatSetWarningVoltage"

# Battery low
# Test API : adiBatSetLowVoltage(const Batteries* Voltages);
# Test API : adiBatGetLowVoltage(Batteries* Voltages);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 "Scenario: adiBatSetLowVoltage"


# ===== PIC Alarm (& configuration) auto =====
# Test API : adiEnableRtcAlarmEvent(const Time* alarmTime, void (*CallbackFunction)(const Event wdEvent));
# Test API : adiDisableRtcAlarmEvent(void);
# Test API : adiRtcGetAlarm(Time* alarmTime);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_auto [PIC][RTC][ALARM][UNITTEST][AUTO]
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section PIC_RTC_ALARM_CONF_auto [PIC][RTC][ALARM][UNITTEST][AUTO]

# ===== adiWatchdogSetSystemRestart & adiWatchdogGetSystemRestart  =====
# Test API : adiWatchdogSetSystemRestart(bool SystemRestartWhenTimeOut);
# Test API : adiWatchdogGetSystemRestart(bool* SystemRestartWhenTimeOut);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 "Scenario: adiWatchdogSetSystemRestart"

# ===== SRAM =====
# Test API : adiSramGetSize(uint32_t* Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Capacity

# Test API : adiSramRead(uint32_t Address, uint8_t* Buffer, size_t Length);
# Test API : adiSramWrite(uint32_t Address, const uint8_t* Buffer, size_t Length);
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Same_Pattern_0xA5

./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Random_Pattern

./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_Performance

# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ));
# Test API : adiSramAsyncWriteWithVerify( uint32_t SRAMAddress, uint32_t SRAMAccessLength, uint8_t *MainMemoryAddress );
# Test API : adiSramWriteWithVerify( uint32_t SRAMAddress, uint32_t SRAMAccessLength, uint8_t *MainMemoryAddress, uint32_t *ErrorAddress );
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_AutoVerify

# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ));
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size);
# Test API : adiSramAsyncBankCopy( uint32_t Address, uint32_t Length, uint32_t SourceBank, uint32_t DestinationBank);
# Test API : adiSramBankCopy( uint32_t Address, uint32_t Length, uint32_t SourceBank, uint32_t DestinationBank);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_BankCopy

# Test API : adiSramSetCallback(ESRAM_CALLBACK_TYPE CallbackType, void ( *CallbackFunction )( AsyncSramData* ));
# Test API : adiSramGetBankInformation( uint32_t *Number, uint32_t *Size);
# Test API : adiSramAsyncBankCompare( uint32_t SourceBank, uint32_t DestinationBank, uint32_t Address, uint32_t Length);
# Test API : adiSramBankCompare( uint32_t SourceBank, uint32_t DestinationBank, uint32_t Address, uint32_t Length, uint32_t *ErrorAddress);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_BankCompare

# Test API : adiSramWriteWithVerify( uint32_t SRAMAddress, uint32_t SRAMAccessLength, uint8_t *MainMemoryAddress, uint32_t *ErrorAddress );
# Test API : adiSramAsyncCalculateCRC32( uint32_t StartAddress, uint32_t Length);
# Test API : adiSramCalculateCRC32( uint32_t StartAddress, uint32_t Length, uint32_t *CRC32);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SRAM_CalculateCRC32

# ===== RAW COM Signal control =====
# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle);
# Test API : adiSerialClose(SerialHandle* Handle);
# Test API : adiSerialSetSignal(SerialHandle Handle, const uint8_t SignalMask, const uint8_t UartSignal);
#   --serial-port available values : LEC1_COM1, LEC1_COM2
#   --signal-mask available values : LEC1_COM1: 0~3, LEC1_COM2: 0~1
#   --signal-value available values: LEC1_COM1: 0~3, LEC1_COM2: 0~1 (Bits will only effect if they are assigned in --signal-mask bits)
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --serial-port LEC1_COM1 --signal-mask 3 --signal-value 3 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiSerialSetSignal [ADiDLL][LEC1][RAWCOM][SIGNAL]
./idll-test --serial-port LEC1_COM2 --signal-mask 1 --signal-value 1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiSerialSetSignal [ADiDLL][LEC1][RAWCOM][SIGNAL]

# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle);
# Test API : adiSerialClose(SerialHandle* Handle);
# Test API : adiSerialGetSignal(SerialHandle Handle, uint8_t* UartSignal);
#   --serial-port available values : LEC1_COM1, LEC1_COM2
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --serial-port LEC1_COM1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiSerialGetSignal [ADiDLL][LEC1][RAWCOM][SIGNAL]
./idll-test --serial-port LEC1_COM2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section adiSerialGetSignal [ADiDLL][LEC1][RAWCOM][SIGNAL]

# Test API : adiSerialOpen(const char* SerialPortId, SerialConfig Config, SerialHandle* Handle);
# Test API : adiSerialClose(SerialHandle* Handle);
# Test API : adiSerialWrite(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumWritten);
# Test API : adiSerialRead(SerialHandle Handle, uint8_t* Buffer, size_t BufLen, size_t* NumRead);
# Test API : adiSerialSetSignal(SerialHandle Handle, const uint8_t SignalMask, const uint8_t UartSignal);
# Test API : adiSerialGetSignal(SerialHandle Handle, uint8_t* UartSignal);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test --serial-port LEC1_COM1 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_RAWCOM_FULLFUNC_SIGNAL [ADiDLL][LEC1][RAWCOM][SIGNAL]
./idll-test --serial-port LEC1_COM2 -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section LEC1_RAWCOM_FULLFUNC_SIGNAL [ADiDLL][LEC1][RAWCOM][SIGNAL]

# Test API : adiSerialGetPortCount(uint64_t* NumPorts);
# Test API : adiSerialGetPortName(uint64_t PortIndex, char* PortName, size_t Length);
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
./idll-test -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SerialPort_GetPort_Num_Name


# ===== 4xGPIO (only for SA3X) =====
# Test API : adiGpioSetPort(uint64_t PortValue)
# Test API : adiGpioGetPort(uint64_t* PortValue)
# Depend on FPGA configuration, the GPO pin number maybe from 0 to 8. The possible GPIO_PORT_VAL range is from 0x0 to 0xFF.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --GPIO_PORT_VAL 0xF -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SA3X_4xGPIO_by_Port

# Test API : adiGpioGetPin(uint8_t BitId, bool* Value)
# Test API : adiGpioSetPin(uint8_t BitId, bool Value)
# Depend on FPGA configuration, the GPO pin number maybe from 0 to 8. The possible value range is from 0x0 to 0xFF.
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ./idll-test --GPIO_PIN_ID 0x0 --GPIO_PIN_VAL true -- --EBOARD_TYPE EBOARD_ADi_LEC1 --section SA3X_4xGPIO_by_Pin