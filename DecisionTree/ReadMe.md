### 决策树类型
* 按模型目标分: 分类（预测离散值）和回归（预测连续值）
* 构建方式分： ID3，C4.5，CART

### 决策树构建
分裂属性，让根据这个属性分裂后的各个分裂子集尽可能的“纯”。

* 将所有的特征看成一个一个的节点
* 遍历每个特征的每一种分割方式，找到最好的分割点，计算划分之后所有子节点的'纯度'信息。
* 对各个分裂出来的子集继续分割，直到子集足够纯。

### 量化纯度
三个公式都是越大越纯
* Gini系数：<img src="http://chart.googleapis.com/chart?cht=tx&chl=Gini=1-\sum^n_{i=1}P(i)^2" style="border:none;">
* 墒：<img src="http://chart.googleapis.com/chart?cht=tx&chl=H=-\sum^n_{i=1}P(i)log_2(P(i))" style="border:none;">
* 错误率：<img src="http://chart.googleapis.com/chart?cht=tx&chl=E=1-max_{i=1}^n\{P(i)\}" style="border:none;">
