#!/usr/bin/env fontforge
# -*- mode: python; coding: utf-8 -*-

# install fontforge for macOS
# brew install fontforge

from bdflib import reader
from bdflib import writer
import fontforge

baseFont = fontforge.open("./pix32.ttf")
print(' ')
print(' ')
print(baseFont)
print('------------')

# AutoTrace all glyphs, add extrema and simplify.
print('Processing...')
# baseFont.selection.all()
# baseFont.autoTrace()
# baseFont.addExtrema()
# baseFont.simplify()
baseFont.generate('pix32.ttf', 'ttf')
baseFont.close()

print(' ')
print('🚀 Done!')
print(' ')
