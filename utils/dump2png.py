#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from PIL import Image, ImageDraw, ImageFont
import sys

if len(sys.argv) <= 1:
	print("Usage: %s <minitel 5 character set eprom dump filename>" % sys.argv[0])
	exit(1)

fd = open(sys.argv[1], "rb")

width = 330
height = 180
image = Image.new('P', (width, height), 0)
image.putpalette((
	              255, 255, 255,
	              222, 255, 222,
	              0, 0, 0,
	             ))

fnt = ImageFont.truetype("LiberationMono-Regular.ttf", 11) # fonts are in /usr/share/fonts/truetype
draw = ImageDraw.Draw(image)

def decode(b, x, y):
	s = ""
	m = 128; i=0
	while m != 0:
		s+='#' if b&m else ' '
		image.putpixel((x+i, y), 2 if b&m else 1)
		m>>=1; i+=1
	return s

def zbin(b, size=8):
	return bin(b)[2:].zfill(size)

count = 0

for a, b in enumerate(fd.read()):
	if a <  0x6000: assert b == 255; continue
	if a >= 0x7e50: assert b == 255; continue

	# 485 '16-bytes' zones from 0x6000 to 0x7E5F, with only 10 bytes used
	if 0 <= a & 0x000f <= 9:
		x = (count  % 32)*9
		y = (count // 32)*11 + (a & 0xf) + 2
		res = decode(b, x+38, y)

		if x == 0 and (a&0xf==0):
			draw.text((x, y-1), "%04Xh" % a, fill=2, font=fnt)
		print("%04xh [%s] 0x%02X [%8s]  %s" % (a, zbin(a, 15), b, zbin(b), res))
		continue
	else:
		if a & 0xf == 15:
			count+=1
	assert b == 0
	print("%04xh [%s] 0x%02X [%8s]" % (a, zbin(a, 15), b, zbin(b)))

print()
image.show()
