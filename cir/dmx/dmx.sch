EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Interface_UART:MAX3485 U1
U 1 1 62B5A8FB
P 4850 2900
F 0 "U1" H 4600 3450 50  0000 C CNN
F 1 "MAX3485" H 4600 3350 50  0000 C CNN
F 2 "Package_SO:SOP-8_3.9x4.9mm_P1.27mm" H 4850 2200 50  0001 C CNN
F 3 "https://datasheets.maximintegrated.com/en/ds/MAX3483-MAX3491.pdf" H 4850 2950 50  0001 C CNN
	1    4850 2900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 62B5AFEA
P 4300 2900
F 0 "#PWR0101" H 4300 2750 50  0001 C CNN
F 1 "VCC" H 4315 3073 50  0000 C CNN
F 2 "" H 4300 2900 50  0001 C CNN
F 3 "" H 4300 2900 50  0001 C CNN
	1    4300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2900 4300 2900
NoConn ~ 4450 2800
Wire Wire Line
	4450 3000 4300 3000
Wire Wire Line
	4300 3000 4300 2900
Connection ~ 4300 2900
$Comp
L power:VCC #PWR0102
U 1 1 62B5BC9D
P 4850 2400
F 0 "#PWR0102" H 4850 2250 50  0001 C CNN
F 1 "VCC" H 4950 2500 50  0000 C CNN
F 2 "" H 4850 2400 50  0001 C CNN
F 3 "" H 4850 2400 50  0001 C CNN
	1    4850 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 62B5BFED
P 4850 3500
F 0 "#PWR0103" H 4850 3250 50  0001 C CNN
F 1 "GND" H 4855 3327 50  0000 C CNN
F 2 "" H 4850 3500 50  0001 C CNN
F 3 "" H 4850 3500 50  0001 C CNN
	1    4850 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 62B5D0B6
P 4000 3100
F 0 "J1" H 3918 2775 50  0000 C CNN
F 1 "Serial_IN" H 3918 2866 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x03_P2.00mm_Horizontal" H 4000 3100 50  0001 C CNN
F 3 "~" H 4000 3100 50  0001 C CNN
	1    4000 3100
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 62B5D9A5
P 5650 3100
F 0 "J2" H 5568 2775 50  0000 C CNN
F 1 "DMX_OUT" H 5568 2866 50  0000 C CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x03_P2.00mm_Horizontal" H 5650 3100 50  0001 C CNN
F 3 "~" H 5650 3100 50  0001 C CNN
	1    5650 3100
	1    0    0    1   
$EndComp
Wire Wire Line
	5250 2800 5250 3000
Wire Wire Line
	5250 3000 5450 3000
Wire Wire Line
	5450 3100 5250 3100
Wire Wire Line
	4200 3000 4300 3000
Connection ~ 4300 3000
Wire Wire Line
	4200 3100 4450 3100
$Comp
L power:GND #PWR0104
U 1 1 62B5F6B2
P 4200 3200
F 0 "#PWR0104" H 4200 2950 50  0001 C CNN
F 1 "GND" H 4205 3027 50  0000 C CNN
F 2 "" H 4200 3200 50  0001 C CNN
F 3 "" H 4200 3200 50  0001 C CNN
	1    4200 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 62B5FA5F
P 5450 3200
F 0 "#PWR0105" H 5450 2950 50  0001 C CNN
F 1 "GND" H 5455 3027 50  0000 C CNN
F 2 "" H 5450 3200 50  0001 C CNN
F 3 "" H 5450 3200 50  0001 C CNN
	1    5450 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 62B60149
P 6250 3350
F 0 "#PWR0106" H 6250 3100 50  0001 C CNN
F 1 "GND" H 6255 3177 50  0000 C CNN
F 2 "" H 6250 3350 50  0001 C CNN
F 3 "" H 6250 3350 50  0001 C CNN
	1    6250 3350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 62B604FF
P 6250 3050
F 0 "#PWR0107" H 6250 2900 50  0001 C CNN
F 1 "VCC" H 6265 3223 50  0000 C CNN
F 2 "" H 6250 3050 50  0001 C CNN
F 3 "" H 6250 3050 50  0001 C CNN
	1    6250 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 62B606E7
P 6250 3200
F 0 "C1" H 6365 3246 50  0000 L CNN
F 1 "C" H 6365 3155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6288 3050 50  0001 C CNN
F 3 "~" H 6250 3200 50  0001 C CNN
	1    6250 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
