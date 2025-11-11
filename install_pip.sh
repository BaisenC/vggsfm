#!/bin/bash

# --- 1. 设置 Python 虚拟环境 (替换 conda create) ---
export ENV_NAME=vggsfm_pip_env
export PYTHON_VERSION=3.10

echo "正在创建 Python $PYTHON_VERSION 虚拟环境，名称为 $ENV_NAME..."
# 确保您系统中有 python3.10
python3.10 -m venv $ENV_NAME

echo "激活环境..."
source $ENV_NAME/bin/activate

# --- 2. 升级 pip ---
pip install --upgrade pip

# --- 3. 安装 PyTorch (cu121 对应 CUDA 12.1) ---
export PYTORCH_VERSION=2.1.0
echo "正在安装 PyTorch $PYTORCH_VERSION (CUDA 12.1)..."
# 这是最关键的一步：使用 --index-url 来获取正确的 CUDA 12.1 预编译包
pip install torch==$PYTORCH_VERSION torchvision --index-url https://download.pytorch.org/whl/cu121

# --- 4. 安装 PyTorch3D (匹配 Py3.10, cu121, torch2.1.0) ---
echo "正在安装 PyTorch3D 0.7.5..."
# PyTorch3D 同样需要特定于 PyTorch 和 CUDA 版本的 wheel 文件
pip install pytorch3d==0.7.5 -f https://dl.fbaipublicfiles.com/pytorch3d/packaging/wheels/py310_cu121_torch2.1.0/download.html

# --- 5. 安装所有其他的 pip 依赖项 ---
echo "正在安装 fvcore 和 iopath..."
pip install fvcore iopath

echo "正在安装 hydra, omegaconf, opencv 等..."
pip install hydra-core --upgrade
pip install omegaconf opencv-python einops visdom tqdm scipy plotly scikit-learn imageio[ffmpeg] gradio trimesh huggingface_hub

# --- 6. 安装 LightGlue (来自 Git) ---
echo "正在安装 LightGlue..."
git clone https://github.com/jytime/LightGlue.git dependency/LightGlue
cd dependency/LightGlue/
python -m pip install -e .  # editable mode
cd ../../

# --- 7. 安装有特定版本的包 (Numpy, PyColmap, PyCeres, Poselib) ---
echo "正在安装 numpy, pycolmap, pyceres, poselib..."
# 严格按照 install.sh 中指定的版本
pip install numpy==1.26.3
pip install pycolmap==3.10.0
pip install pyceres==2.3
pip install poselib==2.0.2

# --- 8. 安装 VGGSfM ---
echo "正在安装 VGGSfM..."
python -m pip install -e .

echo "---"
echo "纯 Pip 安装完成。环境 '$ENV_NAME' 已准备就绪。"
echo "请运行 'source $ENV_NAME/bin/activate' 来使用它。"