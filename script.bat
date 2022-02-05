if "%2"=="" (SET "StartingPoint=00:00:0.0" ) ELSE ( SET "StartingPoint=%2")
for %%f IN (*.%1) DO (
	ffmpeg -hwaccel auto -y -ss "%StartingPoint%" -t 3 -i  "%%f" -i mask.png -filter_complex "[0]scale=512:512[ava];[1]scale=512:512,format=rgba,alphaextract[alfa];[ava][alfa]alphamerge" -c:v libvpx-vp9 -b:v 320k -an "%%~nf.webm"
)
SET /p prompt="Delete input files [y/n]?"
IF "%prompt%" == "y" (
	for %%f IN (*.%1) DO (
		del "%%f"
	)
) ELSE (
	ECHO "Finished."
)
