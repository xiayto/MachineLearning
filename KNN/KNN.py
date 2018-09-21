import numpy as np
from sklearn import datasets
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split 

def classify(inX, trainData, label, k):
    len_trainData = trainData.shape[0]
    copy_inX = np.tile(inX, (len_trainData, 1))  #np.tile(A, (a, b)) 表示A循环b此，再复制a份
    distanceMat = copy_inX - trainData
    # 欧式距离计算
    distanceMat = distanceMat ** 2
    distanceSum = distanceMat.sum(axis = 1) #行为方向求和，如果axis=0，是列为方向的求和
    distances = distanceSum ** 0.5
    sortDistancesIndex = distances.argsort()
    classCount = {}
    for i in range(k):
        voteLabel = label[sortDistancesIndex[i]]
        classCount[voteLabel] = classCount.get(voteLabel, 0) + 1 #字典get方法，get(key, init)
    sortedClassCount = sorted(classCount.items(), key=lambda x:x[1], reverse=True)
    return sortedClassCount[0][0]
    
def evaluateKNN(x_train, y_train, x_test, y_test, k):
    error = 0
    for i in range(x_test.shape[0]):
        labelI = classify(x_test[i], x_train, y_train, k)
        if labelI != y_test[i]:
            error += 1
    return 1 - error/x_test.shape[0] 
