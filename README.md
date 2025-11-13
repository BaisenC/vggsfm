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

<details>
<summary><strong>What should I do if I encounter an out-of-memory error?</strong></summary>

We may encounter an out-of-memory error when the number of input frames or query points is too high. In v2.0, we address this by splitting the points into several chunks and running the prediction separately. This involves two hardcoded hyperparameters: ```max_points_num=163840``` in [predict_tracks](https://github.com/facebookresearch/vggsfm/blob/cfbc06e2f30639073b52d65828e6a6d27087c4f4/vggsfm/runners/runner.py#L894C20-L894C26) and ```max_tri_points_num=819200``` in [triangulate_tracks](https://github.com/facebookresearch/vggsfm/blob/cfbc06e2f30639073b52d65828e6a6d27087c4f4/vggsfm/utils/triangulation.py#L712). These values are set for a ```32GB``` GPU. If your GPU has less or more memory, reduce or increase these values ​​accordingly.

</details>

