#!/bin/sh

export CUPY_INSTALL_USE_HIP=1
export HCC_AMDGPU_TARGET=gfx90a,gfx942,gfx1030

HIPCC=`readlink $GUIX_ENVIRONMENT/bin/hipcc`
export ROCM_HOME=${HIPCC%%/bin/hipcc}
export CUB_INCLUDE_PATH=`readlink $GUIX_ENVIRONMENT/include/hipcub`

export CFLAGS="-I$GUIX_ENVIRONMENT/include"

export CPLUS_INCLUDE_PATH=$GUIX_ENVIRONMENT/include

rm -rf log.txt && pip3 install --use-pep517 --no-build-isolation -vvv --log log.txt -e .
