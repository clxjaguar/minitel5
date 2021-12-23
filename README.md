# Minitel 5

The Minitel was a french dump terminal with embedded modem, at the golden age before Internet. Typically almost cubic and with CRT screen, they were almost free to have one at home (the model 1 was lend for free), so, it was a huge success and a lot of people (including me) had their first experience with telematic playing with that thing. The minitel 5 was a really more rare to encounter version. Flat, with LCD screen and battery, this "laptop-style" terminal could be used in phone booths and cars.

I got one, but it is very strangely crashing at the second key press. And as there seems to be no documentation available, there is this git repository.

## EPROM Dumps

There are two 27C256 EPROM on the Minitel 5 board.

The first is the main EPROM, in socket `MN3`, containing the all the firmware as the 80C32 microcontroller is ROMless. Beware, as my minitel 5 is crashing, this rom **may** be corrupted. If somebody can dump it's own device, it could be very interesting for me to compare.

[Link to the fist dump file](dumps/minitel5_main_eprom.bin)

The second EPROM, in socket `MN8`, is connected to the character generation IC, and solely containing the bitmap font. 485 '16-bytes' zones from 0x6000 to 0x7E5F, with only first 10 bytes used in each block (the 6 extra are 0x00), one byte for each line of each character, where each bit is a pixel. Everything before address 0x6000 and from 0x7E50 to the end is filled with 0xFF.

![Minitel 5 character generator EPROM content](doc/minitel5_character_generator_eprom_2x.png)

[Link to the second dump file](dumps/minitel5_character_generator_eprom.bin)
