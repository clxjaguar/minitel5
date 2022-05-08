# Minitel 5

The Minitel was a french videotext terminal with an embedded modem which had its Golden Age before the rise of Internet. Typically cubic, with an included CRT screen and, more importantly, you could have one at home for cheap (the model 1 was "lent" for free), so, it was a huge success and a lot of people (including me) had their first experience "being online" playing with that thing. The Minitel 5 was a version really more rare to encounter. Flat, with an LCD screen and contained a rechargeable battery, this "laptop-style" terminal could be used in phone booths and cars.

I've got one, but [it is very strangely crashing at the second key press](https://www.youtube.com/watch?v=lb3u2duY9KQ). As there seems to be no documentation yet available for it, I made this git repository.

## EPROM Dumps

There are two 27C256 EPROM on the Minitel 5 board.

The `MN8` EPROM (directly soldered), is connected to the character generation IC and contains solely the bitmap font. 485 '16-bytes' zones from 0x6000 to 0x7E5F, with only the first 10 bytes used in each block (the 6 extra are always 0x00), one byte for each line of each character, where each bit is a pixel. Everything before address 0x6000 and from 0x7E50 to the end is filled with 0xFF.

![Minitel 5 character generator EPROM content](doc/minitel5_character_generator_eprom_2x.png)

[Link to the character generator EPROM dump file](dumps/minitel5_character_generator_eprom.bin)

![Picture of GENE M5](dumps/minitel5_character_generator_eprom.jpg)

The other one is the main EPROM, in socket `MN3`, containing all the firmware as the 80C32 microcontroller is ROMless. Among with the firmware version (HX0141AA1/P07), we could find the date 1990-04-23 in it. As my minitel 5 is crashing at keystrokes, I originally had doubts about it, but we could test my EPROM working once inserted in the Alexxr6's minitel 5 in place of his own `MN3` EPROM.

[Link to the HX0141AA1/P07 firmware EPROM dump file](dumps/1990-04-23_HX0141AA1_P07.bin)

![Picture of_HX0141AA1/P07](dumps/1990-04-23_HX0141AA1_P07.jpg)

This is the dump of Alexxr6's minitel `MN3` EPROM. We could also find a date (1990-04-13) and the version number (HX0141BA1/P05).

[Link to the HX0141BA1/P05 firmware EPROM dump file](dumps/1990-04-13_HX0141BA1_P05.bin)

![Picture of_HX0141BA1/P05](dumps/1990-04-13_HX0141BA1_P05.jpg)


## Integrated circuits

* `MN1` MHS 80C32 (MCU)
* `MN2` MHS MBSR-2000F11-5 DECOPLAT-1
* `MN3` NEC D27C256AD-15 (main EPROM)
* `MN4` Sharp LH5164-10 (backup RAM)
* `MN5` ROM/RAM "dual-dual row" (empty socket)
* `MN6` OKI M6255 (dot matrix lcd controller)
* `MN7` MHS MBSM-2000F05-5 VIDEOPLAT-1)
* `MN8` NEC D27C256AD-15 (bitmap font EPROM)
* `MN9` Philips FCB61C65LL-70T (SRAM)
* `MN10` Philips FCB61C65LL-70T (SRAM)
* `MN11` Motorola HC245A (3–state octal latch)
* `MN12` Motorola HC245A (3–state octal latch)
* `MN13` Motorola HC00A (quad 2-input NAND gate)
* `MN14` Harris HC04 (hex inverter)
* `MN15` Motorola HC245A (3–state octal latch)
* `MN16` Motorola HC245A (3–state octal latch)
* `MN18` Motorola HC4075 (triple 3-input OR gate)
* `MN19` RCA(?) HC273 (octal D latch w/common clock and reset)
* `MN201` ST TSB7513CP (single chip asynchronous FSK modem)
* `MN202` Philips PC74HC4053T (triple 2-channel analog multiplexer/demultiplexer)
* `MN203` TI(?) 27M4C (quad low power CMOS op-amp)
* `MN204` ST EFG71891PD (DTMF generator w/serial input)
* `MN205` Harris HC4052 (dual 4-channel analog multiplexer/demultiplexer)
* `MA101` Motorola MC78M08CT (8V positive linear regulator)
* `MA102` TL431 (precision programmable reference)
* `MA103` National LM3578N (DIP-8 switching regulator)
* `MA104` National ADC0831CCN (single differential input 8-bit ADC w/serial I/O)
* `MA105` National LM385M (1.2V micropower voltage reference)
* `MA201`, `MA202`, `MA203` Harris H11AG2 (phototransistor optocouplers)

## PCB Reverse Engineering

This was the crazy part of this project. It took months for redoing the schematics from the board.
Also, this board is a AY4 version from Matra, with some factory mods (cut traces, manually added wires, also not mounted components).

![Picture of_PCB TOP](pcb/minitel5-ay4-pcb-top.png)

![Picture of PCB BOT](pcb/minitel5-ay4-pcb-bottom.png)

[Link to the large GIMP file (> 100MB)](pcb/minitel5-ay4-pcb.xcf)

## Reversed schematics

Pfiuh. This was hard work for sure!

[Link to the Kicad files directory](kicad/)

[Link to the schemarics PDF export file](kicad/output/minitel5.pdf)

* MCU, reset circuitry, main EPROM, serial communications, EPROM, modem, extension cartridges (ROM or RAM), radiocom 2000 connector, sound output, keyboard pins header

[![Schematics](kicad/output/main.png)](kicad/output/main.png)

* Video generation circuits, outputs to the LED panel

[![Schematics](kicad/output/video.png)](kicad/output/video.png)

* Power supplies, main and backup batteries, trickle and fast charger, ADC (for checking battery level)

[![Schematics](kicad/output/power.png)](kicad/output/power.png)

* Phone line interface

[![Schematics](kicad/output/phoneline.png)](kicad/output/phoneline.png)

## Acknowledgements

People I wish to thank:

* **Ghyom** for giving me that ancient device
* **Furrtek** for his help for recognising Harris old IC logo and the 27M4C op-amp
* **Fréderic** from *CEM de Ronchin* for his help in desoldering `MN8`
* **nikiroo** for his spellchecks
* **Alexxr6**, who own another minitel 5 we could play with (without enclosure the `MN2` reset fix)

## Bonus pictures: How to dump the EPROMS?

### Fast solution: using a EEPROM programmer, if you have it.

![Using a EEPROM programmer to dump MN8](doc/dump_solution1.jpg)

(on this picture, a TL866II PLus, with the `MN8` EPROM containing the font)

### Longer solution: connect a microcontroller to every address and data line, and to a computer

![Using a MCU to dump MN3](doc/dump_solution2.jpg)

(because I didn't had the EEPROM programmer when I dumped `MN3` EPROM)
