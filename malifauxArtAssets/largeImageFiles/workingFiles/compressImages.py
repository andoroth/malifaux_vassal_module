import os
from glob import glob
from os.path import isfile, join

from PIL import Image, ImageFilter
from io import BytesIO

outDir = '..\\compressedImageFiles\\';
inDir = '..\\'

filelist = [f for f in os.listdir(inDir) if isfile(join(inDir, f))]
for filePath in filelist:
    file = os.path.basename(filePath)
    if not (".png" in file):
        continue
    imOriginal = Image.open(os.path.join(inDir, file))
    if imOriginal.mode == 'RGBA':
        imAlpha = imOriginal.getchannel('A')
        blankAlphaChannel = Image.new('L', imAlpha.size, 255)
        imOriginal.putalpha(blankAlphaChannel)

    imConverted = imOriginal.copy().convert('RGB')
    imConverted = imConverted.filter(filter=ImageFilter.GaussianBlur(radius=0.5))

    buffer = BytesIO()
    imConverted.save(buffer, "JPEG", quality=23)
    buffer.seek(0)
    imCompressed = Image.open(buffer)

    if imOriginal.mode == 'RGBA':
        buffer = BytesIO()
        imAlpha.save(buffer, "JPEG", quality=23)
        buffer.seek(0)
        compressedAlpha = Image.open(buffer)
        imCompressed.putalpha(compressedAlpha)

    imCompressed.save(os.path.join(outDir, file), 'PNG', optimize=True)
