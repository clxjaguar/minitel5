EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Minitel 5 to smartphone cable"
Date "2022-11-22"
Rev "A"
Comp "clx.freeshell.org"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:Microphone MK1
U 1 1 637CA67A
P 3800 2950
F 0 "MK1" H 3670 2996 50  0001 R CNN
F 1 "Microphone" H 3930 2950 50  0000 L CNN
F 2 "" V 3800 3050 50  0001 C CNN
F 3 "~" V 3800 3050 50  0001 C CNN
	1    3800 2950
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 637CDE28
P 3350 2950
F 0 "SW1" V 3350 2902 50  0001 R CNN
F 1 "SW_Push" V 3305 2902 50  0001 R CNN
F 2 "" H 3350 3150 50  0001 C CNN
F 3 "~" H 3350 3150 50  0001 C CNN
	1    3350 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 3150 3350 3200
Wire Wire Line
	3350 3200 3800 3200
Wire Wire Line
	3800 3200 3800 3150
Wire Wire Line
	3800 2750 3800 2700
Wire Wire Line
	3800 2700 3350 2700
Wire Wire Line
	3350 2700 3350 2750
Connection ~ 3800 3200
Wire Wire Line
	4850 3100 4450 3100
Wire Wire Line
	4450 3100 4450 2700
Wire Wire Line
	4450 2700 3800 2700
Connection ~ 3800 2700
$Comp
L Connector:AudioPlug4 J1
U 1 1 637CB879
P 5450 3200
F 0 "J1" H 4920 3154 50  0001 R CNN
F 1 "AudioPlug4" H 4920 3109 50  0001 R CNN
F 2 "" H 5800 3100 50  0001 C CNN
F 3 "~" H 5800 3100 50  0001 C CNN
	1    5450 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 3200 2400 3200
Connection ~ 3350 3200
Text Notes 4500 3000 0    50   ~ 0
Measured across the microphone of\nthe headset I'm modifying around 10 \nto ~~20mV peak to peak depending \non how loud I speak, on 0.145Vdc
Text Label 2400 3200 0    50   ~ 0
COMMON
Text Label 2400 3400 0    50   ~ 0
LEFT
Text Label 2400 3300 0    50   ~ 0
RIGHT
$Comp
L Connector:AudioPlug4 J3
U 1 1 637D2949
P 5450 5050
F 0 "J3" H 4920 5004 50  0001 R CNN
F 1 "AudioPlug4" H 4920 4959 50  0001 R CNN
F 2 "" H 5800 4950 50  0001 C CNN
F 3 "~" H 5800 4950 50  0001 C CNN
	1    5450 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2400 3300 4850 3300
Wire Wire Line
	2400 3400 4850 3400
Wire Wire Line
	3800 3200 4850 3200
Wire Wire Line
	4850 5050 4150 5050
Wire Wire Line
	3000 4550 3600 4550
$Comp
L Device:R R1
U 1 1 637D89F0
P 3750 4550
F 0 "R1" V 3543 4550 50  0001 C CNN
F 1 "100k" V 3635 4550 50  0000 C CNN
F 2 "" V 3680 4550 50  0001 C CNN
F 3 "~" H 3750 4550 50  0001 C CNN
	1    3750 4550
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5250 2150 5500
Wire Wire Line
	2150 5500 3550 5500
Wire Wire Line
	3550 5500 3550 5250
Wire Wire Line
	3550 5250 4850 5250
$Comp
L Device:R R2
U 1 1 637DB2D2
P 4150 4800
F 0 "R2" V 3943 4800 50  0001 C CNN
F 1 "1k" H 4080 4800 50  0000 R CNN
F 2 "" V 4080 4800 50  0001 C CNN
F 3 "~" H 4150 4800 50  0001 C CNN
	1    4150 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4150 4950 4150 5050
Connection ~ 4150 5050
Wire Wire Line
	4150 4650 4150 4550
Wire Wire Line
	4150 4550 3900 4550
Text Label 4250 5050 0    50   ~ 0
GND
Text Label 4250 5250 0    50   ~ 0
LEFT
Wire Wire Line
	4150 4550 4450 4550
Wire Wire Line
	4450 4550 4450 4950
Wire Wire Line
	4450 4950 4850 4950
Connection ~ 4150 4550
NoConn ~ 2250 5050
NoConn ~ 2250 4950
Text Notes 4500 4800 0    50   ~ 0
The 1k resistor is part of the divider \nbridge, but also useful to make the \nphone detect it have an headset
Text Notes 2962 4527 0    50   ~ 0
~~2Vpp
Text Notes 3050 4900 0    50   ~ 0
No DC-blocking capacitor \nneeded, as the minitel 5 \nalready have C228
Text Notes 3950 5500 0    50   ~ 0
Depending on the phone or other device,\n"S" and "R2" wires may have to be swapped
Text Label 4100 3200 0    50   ~ 0
GND
Wire Notes Line
	2000 2250 6150 2250
Wire Notes Line
	6150 2250 6150 3700
Wire Notes Line
	6150 3700 2000 3700
Wire Notes Line
	2000 3700 2000 2250
Wire Notes Line
	2000 4200 6150 4200
Wire Notes Line
	6150 4200 6150 5650
Wire Notes Line
	2000 5650 2000 4200
Wire Notes Line
	2000 5650 6150 5650
Text Notes 2000 2250 0    50   ~ 0
Regular Headset (the one I had on hand)
Text Notes 2000 4200 0    50   ~ 0
Modified headset as a "Smartphone / Minitel 5" cable
NoConn ~ 2550 4750
$Comp
L minitel5-rescue:Mini-DIN-9 J2
U 1 1 637F4C17
P 2550 5050
F 0 "J2" H 2550 4761 50  0001 C CNN
F 1 "Mini-DIN-9" H 2550 4761 50  0000 C CNN
F 2 "" V 2575 5040 50  0001 C CNN
F 3 "" V 2575 5040 50  0001 C CNN
	1    2550 5050
	1    0    0    -1  
$EndComp
NoConn ~ 2850 4950
Wire Wire Line
	2850 5250 3000 5250
Wire Wire Line
	3000 4550 3000 5250
Wire Wire Line
	2850 5050 2900 5050
Wire Wire Line
	2850 5150 2900 5150
Wire Wire Line
	2900 5150 2900 5050
Connection ~ 2900 5050
Wire Wire Line
	2900 5050 4150 5050
Wire Wire Line
	2150 5250 2250 5250
NoConn ~ 2250 5150
NoConn ~ 4100 5150
Wire Wire Line
	4850 5150 4100 5150
Text Label 4250 5150 0    50   ~ 0
RIGHT
$EndSCHEMATC
