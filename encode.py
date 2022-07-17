import subprocess
import os
import sys
import sys
from pathlib import Path
format = sys.argv[1];
startingPoint = sys.argv[2] if len(sys.argv[2]) != 0 else '00:00:0.0'
rootdir = './';
for subdir, dirs, files in os.walk(rootdir):
    for file in files:
        if file.endswith(format):
            filename = Path(file).stem
            
            subprocess.call([
                'ffmpeg',
                '-hwaccel',
                'auto',
                '-y',
                '-ss',
                startingPoint,
                '-t',
                '3',
                '-i',
                file,
                '-i',
                'mask.png',
                '-filter_complex',
                '[0]scale=512:512[ava];[1]scale=512:512,format=rgba,alphaextract[alfa];[ava][alfa]alphamerge',
                '-c:v',
                'libvpx-vp9',
                '-b:v',
                '320k',
                '-an',
                filename+'.webm'
            ]);

            print('Delete input files [y/n]?')
            answer = input()
            if answer == 'y':
                os.remove(file)
            elif answer == 'n':
                print('Keeping input files')

            print('Finished!')
