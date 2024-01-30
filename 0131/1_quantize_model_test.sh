#!/bin/bash

#NAME=mobilenet_tf
NAME=yolov4_test
ACUITY_PATH=../bin/

pegasus=${ACUITY_PATH}pegasus
if [ ! -e "$pegasus" ]; then
    pegasus=${ACUITY_PATH}pegasus.py
fi

#--quantizer asymmetric_affine --qtype  uint8
#--quantizer dynamic_fixed_point  --qtype int8(int16,note s905d3 not support int16 quantize) 
# --quantizer perchannel_symmetric_affine --qtype int8(int16, note only T3(0xBE) can support perchannel quantize)
$pegasus  quantize \
	--quantizer asymmetric_affine \
	--qtype uint8 \
	--rebuild \
	--with-input-meta  ${NAME}_inputmeta.yml \
	--model  ${NAME}.json \
	--model-data  ${NAME}.data
