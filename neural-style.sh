#!/bin/bash
#
# Wrapper for neural_style.lua.

cd $(dirname $0)
th neural-style/neural_style.lua $*
