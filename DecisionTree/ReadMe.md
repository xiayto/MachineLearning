### 决策树类型
* 按模型目标分: 分类（预测离散值）和回归（预测连续值）
* 构建方式分： ID3，C4.5，CART

### 决策树构建
分裂属性，让根据这个属性分裂后的各个分裂子集尽可能的“纯”。

* 将所有的特征看成一个一个的节点
* 遍历每个特征的每一种分割方式，找到最好的分割点，计算划分之后所有子节点的'纯度'信息。
* 对各个分裂出来的子集继续分割，直到子集足够纯。

### 量化纯度
* Gini系数：$$Gini=1-\sum^n_{i=1}P(i)^2$$