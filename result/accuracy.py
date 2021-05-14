# -*- coding: utf-8 -*-
"""
@author: Ali HP.J - shiraz University
"""

import numpy as np
from sklearn.model_selection import LeaveOneOut
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
from sklearn.metrics import f1_score
import matplotlib.pyplot as plt


class Struct():
    pass;
def Classifiers(numSamples, SelectedFeatures):
    
    neigh = KNeighborsClassifier(n_neighbors=5)
    AccTest= np.zeros([numSamples,1]);
    AccTrain= np.zeros([numSamples,1]);
    
    PredictLabel= np.zeros([numSamples,1]);
    ind=0;
    for train_index, test_index in loo.split(SelectedFeatures):
        X_train, X_test = SelectedFeatures[train_index], SelectedFeatures[test_index];
        y_train, y_test = Labels[train_index], Labels[test_index];
        
        neigh.fit(X_train, y_train);
            
        AccTrain[ind] = accuracy_score(y_train, neigh.predict(X_train));
        
        PredictLabel[ind]= neigh.predict(X_test);
        AccTest[ind] = accuracy_score(y_test, PredictLabel[ind]);
            
        ind+=1;
    F1= f1_score(Labels, PredictLabel, average='macro');
    return np.mean(AccTest), np.mean(AccTrain), F1;



## Start
DatasetsName= ('Breast','GLIOMA', 'Colon', 'COIL20','ORL', 'PCMAC');
NumDatasets= 6;
Data= [Struct() for i in range(NumDatasets)];
for i in range(NumDatasets):
    Data[i]= np.loadtxt(DatasetsName[i]+'.txt',dtype= float, delimiter=',');

# FeatureSets1_1= [Struct() for i in range(NumDatasets)]; 
FeatureSets2_1= [Struct() for i in range(NumDatasets)];
# FeatureSets1_2= [Struct() for i in range(NumDatasets)];
FeatureSets2_2= [Struct() for i in range(NumDatasets)];
# FeatureSets1_3= [Struct() for i in range(NumDatasets)]; 
FeatureSets2_3= [Struct() for i in range(NumDatasets)];
for i in range(NumDatasets):
    #FeatureSets1_1[i]= np.loadtxt('Result1/'+DatasetsName[i]+'_01D.txt',dtype= int, delimiter=',')-1;
    #FeatureSets1_2[i]= np.loadtxt('Result1/'+DatasetsName[i]+'_02D.txt',dtype= int, delimiter=',')-1;
   # FeatureSets1_3[i]= np.loadtxt('Result1/'+DatasetsName[i]+'_03D.txt',dtype= int, delimiter=',')-1;
    FeatureSets2_1[i]= np.loadtxt('Result2/'+DatasetsName[i]+'_01D.txt',dtype= int, delimiter=',')-1;
    FeatureSets2_2[i]= np.loadtxt('Result2/'+DatasetsName[i]+'_02D.txt',dtype= int, delimiter=',')-1;
    FeatureSets2_3[i]= np.loadtxt('Result2/'+DatasetsName[i]+'_03D.txt',dtype= int, delimiter=',')-1;
    

loo = LeaveOneOut();

# AccTest_S1=[Struct() for i in range(NumDatasets)];   AccTrain_S1=[Struct() for i in range(NumDatasets)];  
AccTest_S2=[Struct() for i in range(NumDatasets)];   AccTrain_S2=[Struct() for i in range(NumDatasets)];  
F1_S2=[Struct() for i in range(NumDatasets)];   
 # F1_S1=[Struct() for i in range(NumDatasets)];


TempData= Data[0];
numSamples, numFeatures= TempData.shape;
Labels= TempData[:,numFeatures-1];
#AccTest_S1[0], AccTrain_S1[0], F1_S1[0] = Classifiers(numSamples, TempData[:,FeatureSets1_1[0]].reshape(-1, 1));
#AccTest_S2[0], AccTrain_S2[0], F1_S2[0] = Classifiers(numSamples, TempData[:,FeatureSets2_1[0]].reshape(-1, 1));

for i in range(NumDatasets):
    
    TempData= Data[i];
    numSamples, numFeatures= TempData.shape;
    Labels= TempData[:,numFeatures-1];
    
    # AccTest_S1[i], AccTrain_S1[i], F1_S1[i] = Classifiers(numSamples, TempData[:,FeatureSets1_3[i]]);
    AccTest_S2[i], AccTrain_S2[i], F1_S2[i] = Classifiers(numSamples, TempData[:,FeatureSets2_3[i]]);
    test=1;



N = NumDatasets
# Train1 = tuple(AccTrain_S1);
Train2 = tuple(AccTrain_S2);
# Test1 = tuple(AccTest_S1);
Test2 = tuple(AccTest_S2);
# F1 = tuple(F1_S1);
F2 = tuple(F1_S2);

ind = np.arange(N) 
width = 0.35 
plt.figure(1)      

plt.bar(ind, Train2, width )

plt.ylabel('Train Accuracy')
plt.title('Train Accuracy for each Dataset base on 30 percent')
plt.grid(True)
plt.xticks(ind + width / 2, DatasetsName)
plt.legend(loc='best')
plt.show()



ind = np.arange(N) 
width = 0.35       
plt.figure(2) 

plt.bar(ind , Test2, width)

plt.ylabel('Test Accuracy')
plt.title('Test Accuracy for each Dataset base on 30 percent')
plt.grid(True)
plt.xticks(ind +width / 2, DatasetsName)
plt.legend(loc='best')
plt.show()



ind = np.arange(N) 
width = 0.35   
plt.figure(3)     

plt.bar(ind , F2, width )

plt.ylabel('F1')
plt.title('F1 for each Dataset base on 30 percent')
plt.grid(True)
plt.xticks(ind +width/ 2, DatasetsName)
plt.legend(loc='best')
plt.show()

