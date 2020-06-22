import geatpy as ea
import numpy as np
from MyProblem import MyProblem
import matplotlib.pyplot as plt

N=50

problem=MyProblem()
Encoding='RI'
NIND=30

np.savetxt('COUNT.csv',[0],delimiter=',')

Field=ea.crtfld(Encoding,problem.varTypes,
                 problem.ranges,problem.borders)
population=ea.Population(Encoding,Field,NIND)
myAlgorithm=ea.moea_NSGA2_templet(problem,population)
myAlgorithm.MAXGEN=120
myAlgorithm.drawing=0

NDSet=myAlgorithm.run()
NDSet.save()

print(np.shape(NDSet.ObjV),np.shape(NDSet.Phen))

plt.scatter(NDSet.ObjV[:,0],NDSet.ObjV[:,1])

np.savetxt('Phen_final.csv',NDSet.Phen,delimiter=',')
np.savetxt('ObjV_final.csv',NDSet.ObjV,delimiter=',')

import pylab
pylab.show()