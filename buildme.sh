#!/bin/sh

HIPCC=`readlink $GUIX_ENVIRONMENT/bin/hipcc`

export HIPCUB=`readlink $GUIX_ENVIRONMENT/include/hipcub`

export CUPY_INSTALL_USE_HIP=1
export HCC_AMDGPU_TARGET=gfx90a,gfx942,gfx1030
export ROCM_HOME=${HIPCC%%/bin/hipcc} 

export PYTHON_PATH=$GUIX_PYTHONPATH


export CC=gcc
export CXX=g++

export CPLUS_INCLUDE_PATH=$GUIX_ENVIRONMENT/include
#export C_INCLUDE_FLAGS=

export CFLAGS="\
 -I$GUIX_ENVIRONMENT/include/hipblas\
 -I$GUIX_ENVIRONMENT/include/hipsparse\
 -I$GUIX_ENVIRONMENT/include/hipfft\
 -I$GUIX_ENVIRONMENT/include/roctracer\
 -I$GUIX_ENVIRONMENT/include/rocsolver\
 -I$GUIX_ENVIRONMENT/include/rccl\
 -I$GUIX_ENVIRONMENT/include/hiprand\
 -v\
 "

#rm -rf log.txt && python -m pip install -vvv --log log.txt -e .

#rm -rf log.txt && pip3 install -vvv --no-build-isolation --log log.txt -e .

rm -rf log.txt && pip3 install --use-pep517 --no-build-isolation -vvv --log log.txt -e .
