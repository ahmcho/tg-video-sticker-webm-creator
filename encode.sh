startingPoint=$(if ["$2" == ""]; then echo "00:00:00"; else echo "$2"; fi)
for filename in *."$1"; do
	ffmpeg -ss "$startingPoint" -t 3 -i "$filename" -i mask.png -filter_complex "[0]scale=512:512[ava];[1]scale=512:512,format=rgba,alphaextract[alfa];[ava][alfa]alphamerge" -c:v libvpx-vp9 -b:v 320k -an "${filename%.*}".webm
done
echo "${Green}Delete input files? [y/n]\n${NC}" 
read yn
case $yn in 
    [Yy]* ) 
        for filename in *."$1"; do
            yes Y | rm -i "$filename";
        done
    ;;
    [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
esac
