EESchema Schematic File Version 2  date Sat 19 Feb 2011 16:33:30 GMT
LIBS:74xx
LIBS:adc-dac
LIBS:analog_switches
LIBS:audio
LIBS:cmos4000
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:device
LIBS:digital-audio
LIBS:display
LIBS:dsp
LIBS:intel
LIBS:interface
LIBS:linear
LIBS:maxim
LIBS:memory
LIBS:microchip
LIBS:microcontrollers
LIBS:motorola
LIBS:parallax
LIBS:philips
LIBS:power
LIBS:regul
LIBS:siliconi
LIBS:special
LIBS:texas
LIBS:valves
LIBS:xilinx
LIBS:z80_mark2-cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 3 13
Title ""
Date "19 feb 2011"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5950 5450 0    60   ~ 0
MCS1
Text Label 4500 3650 0    60   ~ 0
MCS0
Wire Wire Line
	8150 2900 6650 2900
Wire Wire Line
	6650 2900 6650 5450
Wire Wire Line
	6650 5450 5450 5450
Wire Wire Line
	2600 5350 2700 5350
Wire Wire Line
	2150 4850 2150 5550
Wire Wire Line
	2150 5550 4250 5550
Connection ~ 3900 5350
Wire Wire Line
	4250 4650 3900 4650
Wire Wire Line
	3900 4650 3900 5350
Wire Wire Line
	9550 2000 9650 2000
Wire Wire Line
	9550 1900 9650 1900
Wire Wire Line
	9550 1800 9650 1800
Wire Wire Line
	9550 1700 9650 1700
Wire Wire Line
	9550 1600 9650 1600
Wire Wire Line
	9550 1500 9650 1500
Wire Wire Line
	9550 1400 9650 1400
Wire Wire Line
	9550 1300 9650 1300
Wire Wire Line
	6050 1950 6150 1950
Wire Wire Line
	6050 1850 6150 1850
Wire Wire Line
	6050 1750 6150 1750
Wire Wire Line
	6050 1650 6150 1650
Wire Wire Line
	6050 1550 6150 1550
Wire Wire Line
	6050 1450 6150 1450
Wire Wire Line
	6050 1350 6150 1350
Wire Wire Line
	6050 1250 6150 1250
Wire Wire Line
	4550 1250 4650 1250
Wire Wire Line
	4550 1350 4650 1350
Wire Wire Line
	4550 1450 4650 1450
Wire Wire Line
	4550 1550 4650 1550
Wire Wire Line
	4550 1650 4650 1650
Wire Wire Line
	4550 1750 4650 1750
Wire Wire Line
	4550 1850 4650 1850
Wire Wire Line
	4550 1950 4650 1950
Wire Wire Line
	4550 2050 4650 2050
Wire Wire Line
	4550 2150 4650 2150
Wire Wire Line
	4550 2250 4650 2250
Wire Wire Line
	4550 2350 4650 2350
Wire Wire Line
	4550 2450 4650 2450
Wire Wire Line
	4550 2550 4650 2550
Wire Wire Line
	4550 2650 4650 2650
Wire Wire Line
	4550 2950 4650 2950
Wire Wire Line
	4550 3050 4650 3050
Wire Wire Line
	8050 1300 8150 1300
Wire Wire Line
	8050 1400 8150 1400
Wire Wire Line
	8050 1500 8150 1500
Wire Wire Line
	8050 1600 8150 1600
Wire Wire Line
	8050 1700 8150 1700
Wire Wire Line
	8050 1800 8150 1800
Wire Wire Line
	8050 1900 8150 1900
Wire Wire Line
	8050 2000 8150 2000
Wire Wire Line
	8050 2100 8150 2100
Wire Wire Line
	8050 2200 8150 2200
Wire Wire Line
	8050 2300 8150 2300
Wire Wire Line
	8050 2400 8150 2400
Wire Wire Line
	8050 2500 8150 2500
Wire Wire Line
	8050 2600 8150 2600
Wire Wire Line
	8050 2700 8150 2700
Wire Wire Line
	8050 3000 8150 3000
Wire Wire Line
	8050 3100 8150 3100
Wire Wire Line
	3600 5350 4250 5350
Wire Wire Line
	3300 4850 4250 4850
Wire Wire Line
	2050 4850 2400 4850
Connection ~ 2150 4850
Wire Wire Line
	5450 4750 5550 4750
Wire Wire Line
	5550 4750 5550 3650
Wire Wire Line
	5550 3650 3950 3650
Wire Wire Line
	3950 3650 3950 2850
Wire Wire Line
	3950 2850 4650 2850
Text GLabel 2050 4850 0    60   Input ~ 0
A15
Text GLabel 2600 5350 0    60   Input ~ 0
MREQ
$Comp
L 74HC04 IC7
U 5 1 4D0BB523
P 2850 4850
F 0 "IC7" H 3000 4950 40  0000 C CNN
F 1 "74HC04" H 3050 4750 40  0000 C CNN
F 2 "108-5299" H 2850 4850 50  0001 C CNN
	5    2850 4850
	1    0    0    -1  
$EndComp
$Comp
L 74HC00 IC5
U 4 1 4D0BB520
P 4850 5450
F 0 "IC5" H 4850 5500 60  0000 C CNN
F 1 "74HC00" H 4850 5400 60  0000 C CNN
	4    4850 5450
	1    0    0    -1  
$EndComp
$Comp
L 74HC00 IC5
U 3 1 4D0BB51B
P 4850 4750
F 0 "IC5" H 4850 4800 60  0000 C CNN
F 1 "74HC00" H 4850 4700 60  0000 C CNN
	3    4850 4750
	1    0    0    -1  
$EndComp
$Comp
L 74HC04 IC7
U 6 1 4D0BB511
P 3150 5350
F 0 "IC7" H 3300 5450 40  0000 C CNN
F 1 "74HC04" H 3350 5250 40  0000 C CNN
F 2 "108-5299" H 3150 5350 50  0001 C CNN
	6    3150 5350
	1    0    0    -1  
$EndComp
Text GLabel 8050 3000 0    60   Input ~ 0
RD
Text GLabel 8050 3100 0    60   Input ~ 0
WR
Text GLabel 4550 3050 0    60   Input ~ 0
WR
Text GLabel 4550 2950 0    60   Input ~ 0
RD
Text GLabel 9650 2000 2    60   BiDi ~ 0
D7
Text GLabel 9650 1900 2    60   BiDi ~ 0
D6
Text GLabel 9650 1800 2    60   BiDi ~ 0
D5
Text GLabel 9650 1700 2    60   BiDi ~ 0
D4
Text GLabel 9650 1600 2    60   BiDi ~ 0
D3
Text GLabel 9650 1500 2    60   BiDi ~ 0
D2
Text GLabel 9650 1400 2    60   BiDi ~ 0
D1
Text GLabel 9650 1300 2    60   BiDi ~ 0
D0
Text GLabel 6150 1950 2    60   BiDi ~ 0
D7
Text GLabel 6150 1850 2    60   BiDi ~ 0
D6
Text GLabel 6150 1750 2    60   BiDi ~ 0
D5
Text GLabel 6150 1650 2    60   BiDi ~ 0
D4
Text GLabel 6150 1550 2    60   BiDi ~ 0
D3
Text GLabel 6150 1450 2    60   BiDi ~ 0
D2
Text GLabel 6150 1350 2    60   BiDi ~ 0
D1
Text GLabel 6150 1250 2    60   BiDi ~ 0
D0
Text GLabel 4550 2650 0    60   Input ~ 0
A14
Text GLabel 4550 2550 0    60   Input ~ 0
A13
Text GLabel 4550 2450 0    60   Input ~ 0
A12
Text GLabel 4550 2350 0    60   Input ~ 0
A11
Text GLabel 4550 2250 0    60   Input ~ 0
A10
Text GLabel 4550 2150 0    60   Input ~ 0
A9
Text GLabel 4550 2050 0    60   Input ~ 0
A8
Text GLabel 4550 1950 0    60   Input ~ 0
A7
Text GLabel 4550 1850 0    60   Input ~ 0
A6
Text GLabel 4550 1750 0    60   Input ~ 0
A5
Text GLabel 4550 1650 0    60   Input ~ 0
A4
Text GLabel 4550 1550 0    60   Input ~ 0
A3
Text GLabel 4550 1450 0    60   Input ~ 0
A2
Text GLabel 4550 1350 0    60   Input ~ 0
A1
Text GLabel 4550 1250 0    60   Input ~ 0
A0
Text GLabel 8050 2700 0    60   Input ~ 0
A14
Text GLabel 8050 2600 0    60   Input ~ 0
A13
Text GLabel 8050 2500 0    60   Input ~ 0
A12
Text GLabel 8050 2400 0    60   Input ~ 0
A11
Text GLabel 8050 2300 0    60   Input ~ 0
A10
Text GLabel 8050 2200 0    60   Input ~ 0
A9
Text GLabel 8050 2100 0    60   Input ~ 0
A8
Text GLabel 8050 2000 0    60   Input ~ 0
A7
Text GLabel 8050 1900 0    60   Input ~ 0
A6
Text GLabel 8050 1800 0    60   Input ~ 0
A5
Text GLabel 8050 1700 0    60   Input ~ 0
A4
Text GLabel 8050 1600 0    60   Input ~ 0
A3
Text GLabel 8050 1500 0    60   Input ~ 0
A2
Text GLabel 8050 1400 0    60   Input ~ 0
A1
Text GLabel 8050 1300 0    60   Input ~ 0
A0
$Comp
L RAM_32KO U?
U 1 1 4D0BB466
P 8850 2100
AR Path="/4D0BB44C/4D0BB464" Ref="U?"  Part="1" 
AR Path="/4D0BB44C/4D0BB466" Ref="IC?"  Part="1" 
F 0 "IC?" H 9000 3000 70  0000 C CNN
F 1 "RAMTRON_FM1808" H 9150 1000 60  0000 C CNN
	1    8850 2100
	1    0    0    -1  
$EndComp
$Comp
L RAM_32KO IC?
U 1 1 4D0BB464
P 5350 2050
F 0 "IC?" H 5500 2950 70  0000 C CNN
F 1 "RAMTRON_FM1808" H 5650 950 60  0000 C CNN
	1    5350 2050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
