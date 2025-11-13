配置环境

```python
source install.sh
python -m pip install -e .
```

下载[模型文件](https://drive.usercontent.google.com/download?id=163bHiqeTJhQ2_UnihRNPRA4Y9X8-gZ1-&export=download&authuser=0)，放入ckpt文件夹

运行样例"examples/kitchen"

```python
python demo.py SCENE_DIR=examples/kitchen
```

运行样例"examples/kitchen" + gradio可视化面板

```python
python demo.py SCENE_DIR=examples/kitchen gr_visualize=True
```

