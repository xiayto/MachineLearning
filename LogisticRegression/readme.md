## 线性回归

### 线性回归为什么用均方差作为损失函数

推导过程：
* 写出拟合函数，残差值由中心极限定义可以知道服从正态分布，带入到正态分布函数里面
* 用极大似然估计，取对数可以得到最后的目标函数就是一个最小化均方差的函数

### 防止过拟合

加入正则项，有L1正则项(LASSO回归），L2正则项（Ridge岭回归）

* L1: 能得到解的稀疏性要求，接近0的时候惩罚项不会变小，有较高的求解速度。
* L2: 接近0的时候惩罚项变小，有较高的准确性、鲁棒性、稳定性
* ElasiticNet回归: 如果想同时兼顾稳定性和求解速度，同时加入L1 和 L2正则项，使系数和为1


## 梯度下降

代码：GradientDescent.py  
当函数是凸函数的时候，向导数方向的反方向移动（也就是学习率 * 导数）可以收敛到最小值。

## 逻辑回归

代码：LogisticRegression.py


