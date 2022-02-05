Helper scripts for creating `.webm` files that later can be used as [Telegram Video Stickers]. 

* [Preparation](#preparation)
* [Usage](#usage)

## Preparation

This script is perfect, if you are using Telegram Video message option. It creates a round transparent mask around it, so it can be used as a video sticker. First, record your message, but don't forget [video sticker requirements]. If your video is longer that 3 seconds, script will stop conversion at 3 second mark. Then save your video message inside this folder based on your operating system, proceed further:

## Usage
The script expects you to provide two arguments: video format and starting point, e.g :

`script.bat "avi" "00:00:00"`

If starting point not provided, the default value of `00:00:00` will be used.

After succesfull conversion, you can send newly created `.webm` file to [@Stickers] bot.

 [Telegram Video Stickers]: <https://telegram.org/blog/video-stickers-better-reactions#video-stickers>
 [video sticker requirements]: <https://core.telegram.org/stickers#video-sticker-requirements>
 [@Stickers]: <https://t.me/Stickers>
