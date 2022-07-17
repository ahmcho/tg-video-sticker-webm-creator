Green='\033[0;32m'
NC='\033[0m'
echo "${Green}Before starting the conversion the correct version of ffmpeg should be installed.\nContinue? [y/n]\n${NC}" 
read yn
case $yn in 
    [Yy]* ) 
        sudo apt install python3
        sudo apt-get install ffmpeg
        sudo add-apt-repository ppa:savoury1/ffmpeg4
        sudo add-apt-repository ppa:savoury1/graphics
        sudo add-apt-repository ppa:savoury1/multimedia
        sudo apt full-upgrade
        echo "${Green}All required libraries are installed successfully.\n${NC}"
    ;;
    [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
esac