# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the license found in the
# LICENSE file in the root directory of this source tree.

# This Script Assumes Python 3.10, CUDA 12.1

# Set environment variables
export ENV_NAME=vggsfm
conda create -n $ENV_NAME python=3.10



# conda create -n $ENV_NAME python=$PYTHON_VERSION
conda activate $ENV_NAME

# Install PyTorch, torchvision, and PyTorch3D using conda
conda install pytorch=2.1.0 torchvision pytorch-cuda=12.1 pytorch3d=0.7.5 fvcore iopath pycolmap=3.10.0 pyceres=2.3 -c pytorch -c nvidia -c pytorch3d -c fvcore -c iopath -c conda-forge

# Install pip packages
pip install hydra-core --upgrade
pip install omegaconf opencv-python einops visdom tqdm scipy plotly scikit-learn imageio[ffmpeg] gradio trimesh huggingface_hub

# Install LightGlue
git clone https://ghfast.top/https://github.com/jytime/LightGlue.git dependency/LightGlue

cd dependency/LightGlue/
python -m pip install -e .  # editable mode
cd ../../
echo $LD_LIBRARY_PATH
# Force numpy <2
pip install numpy==1.26.4

# Ensure the version of pycolmap is 3.10.0
pip install pycolmap==0.5.0
pip install pyceres==2.3

# (Optional) Install poselib 
pip install poselib==2.0.2
pip install opencv-python==4.9.0.80

