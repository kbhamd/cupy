#!/bin/sh

export CUPY_INSTALL_USE_HIP=1
export HCC_AMDGPU_TARGET=gfx90a,gfx942,gfx1030

HIPCC=`readlink $GUIX_ENVIRONMENT/bin/hipcc`
export ROCM_HOME=${HIPCC%%/bin/hipcc}
export HIPCUB=`readlink $GUIX_ENVIRONMENT/include/hipcub`

export CPLUS_INCLUDE_PATH=$GUIX_ENVIRONMENT/include

export CXXFLAGS=-O3

export CFLAGS="\
 -I$GUIX_ENVIRONMENT/include/hipblas\
 -I$GUIX_ENVIRONMENT/include/hipsparse\
 -I$GUIX_ENVIRONMENT/include/hipfft\
 -I$GUIX_ENVIRONMENT/include/roctracer\
 -I$GUIX_ENVIRONMENT/include/rocsolver\
 -I$GUIX_ENVIRONMENT/include/rccl\
 -I$GUIX_ENVIRONMENT/include/hiprand\
 "

rm -rf log.txt && pip3 install --use-pep517 --no-build-isolation -vvv --log log.txt -e .
