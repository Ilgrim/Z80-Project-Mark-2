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
Sheet 2 13
Title ""
Date "19 feb 2011"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5800 5150 5800 5050
Wire Wire Line
	5200 5150 5200 5050
Connection ~ 4550 5750
Wire Wire Line
	5800 5650 5800 5750
Wire Wire Line
	5800 5750 4550 5750
Wire Wire Line
	5800 4650 5800 4550
Wire Wire Line
	4550 4650 4550 4150
Wire Wire Line
	4550 4150 4200 4150
Connection ~ 4200 2250
Wire Wire Line
	4200 4150 4200 2250
Connection ~ 5400 2200
Wire Wire Line
	5400 2200 5400 2100
Connection ~ 4400 3000
Wire Wire Line
	6500 3000 3600 3000
Wire Wire Line
	3600 3000 3600 2850
Wire Wire Line
	3600 2850 3200 2850
Wire Wire Line
	2900 2250 3150 2250
Connection ~ 6000 3000
Wire Wire Line
	6000 2600 6000 3000
Connection ~ 5500 2200
Wire Wire Line
	5500 2500 5500 2200
Wire Wire Line
	5500 3000 5500 2900
Wire Wire Line
	4400 3000 4400 2900
Wire Wire Line
	5600 2200 5300 2200
Wire Wire Line
	8500 1800 8400 1800
Wire Wire Line
	9100 1800 9200 1800
Wire Wire Line
	9200 1800 9200 2000
Wire Wire Line
	6500 2200 6400 2200
Wire Wire Line
	4500 2200 4400 2200
Wire Wire Line
	4400 2200 4400 2500
Connection ~ 5500 3000
Wire Wire Line
	4900 2600 4900 3000
Connection ~ 4900 3000
Wire Wire Line
	6500 3100 6500 2900
Connection ~ 6500 3000
Wire Wire Line
	2900 2450 3300 2450
Wire Wire Line
	3300 2450 3300 2650
Wire Wire Line
	3300 2650 3200 2650
Wire Wire Line
	4150 2250 4400 2250
Connection ~ 4400 2250
Wire Wire Line
	6500 2100 6500 2500
Connection ~ 6500 2200
Wire Wire Line
	5200 4650 5200 4550
Wire Wire Line
	4550 5650 4550 5850
Wire Wire Line
	5200 5650 5200 5750
Connection ~ 5200 5750
Wire Wire Line
	4550 5150 4550 5050
$Comp
L +3.3V #PWR?
U 1 1 4D0BBC29
P 5800 4550
F 0 "#PWR?" H 5800 4510 30  0001 C CNN
F 1 "+3.3V" H 5800 4660 30  0000 C CNN
	1    5800 4550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 4D0BBC24
P 5200 4550
F 0 "#PWR?" H 5200 4640 20  0001 C CNN
F 1 "+5V" H 5200 4640 30  0000 C CNN
	1    5200 4550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4D0BBC1E
P 4550 5850
F 0 "#PWR?" H 4550 5850 30  0001 C CNN
F 1 "GND" H 4550 5780 30  0001 C CNN
	1    4550 5850
	1    0    0    -1  
$EndComp
Text Notes 2750 3200 0    60   ~ 0
4mm PANEL SOCKETS
Text Notes 1850 2700 0    60   ~ 0
CONNECT AMMETER\nOR CONNECT WITH 4mm\nLEAD
Text Notes 1550 2350 0    60   ~ 0
DC JACK PIN +VE\n7.5-12VDC
$Comp
L +3.3V #PWR?
U 1 1 4D0BBB1B
P 6500 2100
F 0 "#PWR?" H 6500 2060 30  0001 C CNN
F 1 "+3.3V" H 6500 2210 30  0000 C CNN
	1    6500 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 4D0BBB12
P 5400 2100
F 0 "#PWR?" H 5400 2190 20  0001 C CNN
F 1 "+5V" H 5400 2190 30  0000 C CNN
	1    5400 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 4D0BBB0C
P 6500 3100
F 0 "#PWR?" H 6500 3100 30  0001 C CNN
F 1 "GND" H 6500 3030 30  0001 C CNN
	1    6500 3100
	1    0    0    -1  
$EndComp
Text GLabel 8400 1800 0    60   Output ~ 0
RESET
$Comp
L GND #PWR?
U 1 1 4D0BBA52
P 9200 2000
F 0 "#PWR?" H 9200 2000 30  0001 C CNN
F 1 "GND" H 9200 1930 30  0001 C CNN
	1    9200 2000
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 4D0BBA46
P 8800 1800
F 0 "SW?" H 8950 1910 50  0000 C CNN
F 1 "SW_PUSH" H 8800 1720 50  0000 C CNN
	1    8800 1800
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P?
U 1 1 4D0BBA23
P 2550 2350
F 0 "P?" V 2500 2350 40  0000 C CNN
F 1 "POWER" V 2600 2350 40  0000 C CNN
	1    2550 2350
	-1   0    0    -1  
$EndComp
$Comp
L CONN_1 P?
U 1 1 4D0BBA0F
P 3050 2850
AR Path="/4D0BB9C4/4D0BBA0C" Ref="P?"  Part="1" 
AR Path="/4D0BB9C4/4D0BBA0F" Ref="P?"  Part="1" 
F 0 "P?" H 3130 2850 40  0000 C CNN
F 1 "CONN_1" H 3000 2890 30  0001 C CNN
	1    3050 2850
	-1   0    0    1   
$EndComp
$Comp
L CONN_1 P?
U 1 1 4D0BBA0C
P 3050 2650
F 0 "P?" H 3130 2650 40  0000 C CNN
F 1 "CONN_1" H 3000 2690 30  0001 C CNN
	1    3050 2650
	-1   0    0    1   
$EndComp
$Comp
L SPST SW?
U 1 1 4D0BBA06
P 3650 2250
F 0 "SW?" H 3650 2350 70  0000 C CNN
F 1 "POWER" H 3650 2150 70  0000 C CNN
	1    3650 2250
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 4D0BBA02
P 5800 4850
AR Path="/4D0BB9C4/4D0BB9FE" Ref="D?"  Part="1" 
AR Path="/4D0BB9C4/4D0BBA02" Ref="D?"  Part="1" 
F 0 "D?" H 5800 4950 50  0000 C CNN
F 1 "LED" H 5800 4750 50  0000 C CNN
	1    5800 4850
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 4D0BBA01
P 5200 4850
AR Path="/4D0BB9C4/4D0BB9FE" Ref="D?"  Part="1" 
AR Path="/4D0BB9C4/4D0BBA01" Ref="D?"  Part="1" 
F 0 "D?" H 5200 4950 50  0000 C CNN
F 1 "LED" H 5200 4750 50  0000 C CNN
	1    5200 4850
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 4D0BB9FE
P 4550 4850
F 0 "D?" H 4550 4950 50  0000 C CNN
F 1 "LED" H 4550 4750 50  0000 C CNN
	1    4550 4850
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 4D0BB9FB
P 5800 5400
AR Path="/4D0BB9C4/4D0BB9F8" Ref="R?"  Part="1" 
AR Path="/4D0BB9C4/4D0BB9FB" Ref="R?"  Part="1" 
F 0 "R?" V 5880 5400 50  0000 C CNN
F 1 "180" V 5800 5400 50  0000 C CNN
	1    5800 5400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4D0BB9FA
P 5200 5400
AR Path="/4D0BB9C4/4D0BB9F8" Ref="R?"  Part="1" 
AR Path="/4D0BB9C4/4D0BB9FA" Ref="R?"  Part="1" 
F 0 "R?" V 5280 5400 50  0000 C CNN
F 1 "330" V 5200 5400 50  0000 C CNN
	1    5200 5400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 4D0BB9F8
P 4550 5400
F 0 "R?" V 4630 5400 50  0000 C CNN
F 1 "560" V 4550 5400 50  0000 C CNN
	1    4550 5400
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 4D0BB9F3
P 6500 2700
AR Path="/4D0BB9C4/4D0BB9EF" Ref="C?"  Part="1" 
AR Path="/4D0BB9C4/4D0BB9F3" Ref="C?"  Part="1" 
F 0 "C?" H 6550 2800 50  0000 L CNN
F 1 "10uF" H 6550 2600 50  0000 L CNN
	1    6500 2700
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 4D0BB9F2
P 5500 2700
AR Path="/4D0BB9C4/4D0BB9EF" Ref="C?"  Part="1" 
AR Path="/4D0BB9C4/4D0BB9F2" Ref="C?"  Part="1" 
F 0 "C?" H 5550 2800 50  0000 L CNN
F 1 "10uF" H 5550 2600 50  0000 L CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C?
U 1 1 4D0BB9EF
P 4400 2700
F 0 "C?" H 4450 2800 50  0000 L CNN
F 1 "10uF" H 4450 2600 50  0000 L CNN
	1    4400 2700
	1    0    0    -1  
$EndComp
$Comp
L LD1085V50 IC?
U 1 1 4D0BB9EA
P 6000 2200
F 0 "IC?" H 5750 2400 60  0000 C CNN
F 1 "LD1085V50" H 6000 2300 60  0000 C CNN
	1    6000 2200
	1    0    0    -1  
$EndComp
$Comp
L LD1085V33 IC?
U 1 1 4D0BB9E5
P 4900 2200
F 0 "IC?" H 5000 1900 60  0000 C CNN
F 1 "LD1085V33" H 4900 2300 60  0000 C CNN
	1    4900 2200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
