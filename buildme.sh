#!/bin/sh
#HIPCC=`readlink $GUIX_ENVIRONMENT/bin/hipcc`
#HIPCUB=`readlink $GUIX_ENVIRONMENT/include/hipcub`

export CUPY_INSTALL_USE_HIP=1
export HCC_AMDGPU_TARGET=gfx90a,gfx942,gfx1030
export ROCM_HOME=$GUIX_ENVIRONMENT

#export ROCM_HOME=${HIPCC%%/bin/hipcc}
#export CUB_PATH=${HIPCUB%%/include/hipcub}

#export CFLAGS="-I$GUIX_ENVIRONMENT/include"

export CPLUS_INCLUDE_PATH=$GUIX_ENVIRONMENT/include

rm -rf log.txt && pip3 install --use-pep517 --no-build-isolation -vvv --log log.txt -e .
