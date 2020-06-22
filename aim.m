function f=aim(Phen)
[NIND,M]=size(Phen);
N=201;
tempi=zeros(NIND,N);
temp0=zeros(NIND,1);
for n_ch=1:NIND

E_phi=Phen(n_ch,:)';    
    
model=mphopen('scattering.mph');

P1=1;               %%%%%%%%%%%%%%%%%%%
Lambda=3*10^(-6);

B=P1*20*Lambda;
A=P1*30*Lambda;


phys =model.component('mod1').physics('ewfd');
for i=1:50
name=strcat('port',num2str(i));
temp = phys.feature(name);
temp.selection.set(4*i-1);
temp.set('Thetap', -E_phi(i));
end

model.study('std1').run;
Y=-B/2+B/(N-1)*(0:N-1);
X=A*ones(1,N);
tempi(n_ch,:)=mphinterp(model,'ewfd.normE','coord',[X;Y]);
temp0(n_ch,1)=mphinterp(model,'ewfd.normE','coord',[A;3*Lambda]);
temp0(n_ch,2)=mphinterp(model,'ewfd.normE','coord',[A;-3*Lambda]);

%clear model
mphsave(model)

end
csvwrite('Field_ch.csv',tempi)
f=temp0;
end