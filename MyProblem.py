import numpy as np
import geatpy as ea
import os
import time

N=50
NIND=30
class MyProblem(ea.Problem):
    def __init__(self):
        name='BNH'
        M=2
        maxormins=[-1]*M
        Dim=N
        varTypes=[0]*Dim
        lb=[-np.pi]*Dim
        ub=[np.pi]*Dim
        lbin=[1]*Dim
        ubin=[1]*Dim
        ea.Problem.__init__(self,name,M,maxormins,Dim,
                          varTypes,lb,ub,lbin,ubin)
    def aimFunc(self,pop):
        if os.path.exists('ObjV.csv'):
            os.remove('ObjV.csv')

        COUNT=np.loadtxt('COUNT.csv',delimiter=',')

        np.savetxt('Phen.csv',pop.Phen,delimiter=',')
        np.savetxt('COUNT.csv',COUNT+[1],delimiter=',')
        

        while os.path.exists('ObjV.csv')==0:
            time.sleep(3)

        ObjV=np.loadtxt('ObjV.csv',delimiter=',')

        f1=ObjV[:,0].reshape(NIND,1)
        f2=ObjV[:,1].reshape(NIND,1)

        #pop.CV=np.hstack([(x1-5)**2+x2**2-25,
         #                 -(x1-8)**2-(x2-3)**2+7.7])
        pop.ObjV=np.hstack([f1,f2])




