#!/bin/bash

set -x -e

cd "$(dirname "$0")"
# Usage: produceOutputs <style image> <content image> <output image>
produceOutput() {
  ./main.lua \
    -style_image examples/inputs/$1.jpg \
    -content_image examples/inputs/$2.jpg \
    -backend cudnn \
    -output_image examples/outputs/$3.png
}

# Usage: produceOutputs <content image>
produceOutputs() {
  produceOutput escher_sphere $1 $1_escher
  produceOutput frida_kahlo $1 $1_kahlo
  produceOutput woman-with-hat-matisse $1 $1_matisse
  produceOutput picasso_selfport1907 $1 $1_picasso
  produceOutput the_scream $1 $1_scream
  produceOutput seated-nude $1 $1_seated
  produceOutput shipwreck $1 $1_shipwreck
  produceOutput starry_night $1 $1_starry
}

produceOutputs golden_gate
produceOutputs tubingen
produceOutputs brad_pitt
