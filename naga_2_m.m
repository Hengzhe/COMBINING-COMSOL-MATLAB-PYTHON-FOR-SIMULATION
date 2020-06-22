MAXGEN=120;

py_root='C:\Users\Lenovo\AppData\Local\Programs\Python\Python38\';
for i=1:MAXGEN 
    %disp(i)
   while((csvread(strcat(py_root,'COUNT.csv')))~=i) 
       pause(3)
   end
   disp(i)
   Phen=csvread(strcat(py_root,'Phen.csv'));
   ObjV=aim(Phen);
   disp({i,'generation',ObjV(1,1),ObjV(1,2)})
   csvwrite(strcat(py_root,'ObjV.csv'),ObjV)
end