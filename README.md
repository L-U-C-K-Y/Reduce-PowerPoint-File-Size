# Reduce-PowerPoint-File-Size

Reduce the file size of a PowerPoint file by:

1. Unpacking the .pptx file
1. Optimizing the media files
    * Convert .tiff to .png
    * Resize images to max. width/height of 1920px (can be changed)
    * Compressing the images with ImageOptim
1. Compressing the unpacked files into the .pptx again
1. 🎉

## Requirements

* Have ImageOptim installed
* Currently, only for MacOS

## How to use

Start the script with:

```bash
sh ./reduce-powerpoint-file-size.sh powerpoint.pptx
```

## Credits

Originally found at [https://mybyways.com/blog/fixing-powerpoint-tiff-images-and-fonts](https://mybyways.com/blog/fixing-powerpoint-tiff-images-and-fonts)
