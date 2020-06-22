ObjV=csvread('ObjV.csv');
Phen=csvread('Phen.csv');
py_root='C:\Users\Lenovo\AppData\Local\Programs\Python\Python38\';
[m,n]=size(ObjV);

for i=1:m-1
   for j=i+1:30
       if ObjV(j,1)>ObjV(i,1)
           temp=ObjV(i,:);
           ObjV(i,:)=ObjV(j,:);
           ObjV(j,:)=temp;
           
           temp=Phen(i,:);
           Phen(i,:)=Phen(j,:);
           Phen(j,:)=temp;
       end      
   end
end

csvwrite(strcat(py_root,'ObjV.csv'),(ObjV(21:30,2)))
csvwrite(strcat(py_root,'Phen.csv'),Phen(21:30,:))

