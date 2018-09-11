from numpy import *
from sklearn import datasets
from sklearn.model_selection import train_test_split 

# 用sklearn的癌症数据集做测试
loaded_data = datasets.load_breast_cancer()
x = loaded_data.data
y = loaded_data.target
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2)

# sigmoid函数
def sigmoid(inX):
    return 1.0/(1+exp(-inX))

# 梯度下降法得到逻辑回归的权重参数
def getWeight(trainData, labelData, epoch, alpha):
    x = mat(trainData)
    y = mat(labelData).transpose()
    m, n = shape(x)
    weight = ones((n, 1))
    for i in range(epoch):
        h = sigmoid(x * weight)
        error = y - h
        weight = weight + alpha*x.transpose()*error
    return weight

# 测试准确率
def getWeight(trainData, labelData, epoch, alpha):
    x = mat(trainData)
    y = mat(labelData).transpose()
    m, n = shape(x)
    weight = ones((n, 1))
    for i in range(epoch):
        h = sigmoid(x * weight)
        error = y - h
        weight = weight + alpha*x.transpose()*error
    return weight

weight = getWeight(x_train, y_train, 1000, 0.1)
evaluation(x_test, y_test, weight)
# accurate: 0.9298245614035088
