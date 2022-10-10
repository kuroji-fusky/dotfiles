#!/usr/bin/bash

# Finds mp4 files in a for loop and compresses it
compressDatHoe() {
  for webm_f in *.mp4
  do
    ffmpeg -i $webm_f\
      -vcodec libx264\
    -crf 24\
      "${webm_f%.*}"_compressed.mp4
  done

  # Make a "compressed" folder and places all the compressed
  # files with the "_compressed" name appended
  mkdir -p compressed
  mv *_compressed.mp4 compressed -v
}

# rm -rf *.mp4

echo "Done!"