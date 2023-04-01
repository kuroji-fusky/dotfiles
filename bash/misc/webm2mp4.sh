#!/bin/bash
for webm_f in *.webm; do
  ffmpeg -i $webm_f -an -map_metadata -1 "${webm_f%.*}"_output.mp4
done
mkdir -p mp4_output
mv *.mp4 mp4_output -v
echo "Done!"
