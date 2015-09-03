#!/bin/bash

set -x -e

cd "$(dirname "$0")"

# Usage: produceStyle <style image> <deep dream image> <output image>
produceStyle() {
  ./neural-style.lua \
    -style_image examples/inputs/$1.jpg \
    -content_image examples/outputs/$2 \
    -backend cudnn \
    -output_image examples/outputs/$3_deepdream.png
}

# Usage: produceOutputs <content image>
produceOutputs() {
  ./deepdream.lua \
    -backend cudnn \
    -content_image examples/inputs/$1.jpg \
    -output_image examples/outputs/$1_deepdream.png
  produceStyle escher_sphere $1_deepdream.png $1_escher
  produceStyle frida_kahlo $1_deepdream.png $1_kahlo
  produceStyle woman-with-hat-matisse $1_deepdream.png $1_matisse
  produceStyle picasso_selfport1907 $1_deepdream.png $1_picasso
  produceStyle the_scream $1_deepdream.png $1_scream
  produceStyle seated-nude $1_deepdream.png $1_seated
  produceStyle shipwreck $1_deepdream.png $1_shipwreck
  produceStyle starry_night $1_deepdream.png $1_starry
}

produceOutputs golden_gate
produceOutputs tubingen
produceOutputs brad_pitt
