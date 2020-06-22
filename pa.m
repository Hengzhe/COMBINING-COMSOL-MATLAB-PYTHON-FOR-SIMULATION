%Pareto
ObjV=csvread('ObjV.csv');
is_p=0*ObjV(:,1);

pareto=[];

for i=1:size(ObjV,1)
    is_p(i)=1;
   for j=1:size(ObjV,1)
      if ObjV(j,1)>ObjV(i,1)&&ObjV(j,2)>ObjV(i,2) 
         is_p(i)=0;
         break
      end
   end
   if is_p(i)
       pareto=[pareto;ObjV(i,:)];
   end
end

pareto=1/300000*pareto.^2;
ObjV=1/300000*ObjV.^2;
scatter(pareto(:,1),pareto(:,2))
hold on
scatter(ObjV(:,1),ObjV(:,2),'*')