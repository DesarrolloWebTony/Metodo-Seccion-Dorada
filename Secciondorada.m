%Algoritmo de la sección dorada
%para el problema 
%******************
%min e^(-x)+x^2
%sa. [-5,5]
%*******************
%min x^2+2*x
%sa. [-3,5]
%tol=0.2
%*******************
clear all, clc, close all
%datos de entrada
f=inline('x^2+2*x') %función unidimensional
ak=-3;                     %punto inicial del intervalo
bk=5;                      %límite superior
tol=0.001;                 %tolerancia del método
%condiciones iniciales del algoritmo
gama=0.618;                %número aureo 
lamdak=gama*ak+(1-gama)*bk;%calcula el valor de lamda
miuk=(1-gama)*ak+gama*bk;  %calcula el valor de miu

fl=f(lamdak);              %se evalua la función en lamda
fm=f(miuk);                %se evalua la función miu
flamda=[]; %vector para almacenar las evaluaciones de la f(x)
fmiu=[];   %vector para almacenar las evaluaciones de la f(x)
iter=0;    %se inician las iteraciones
while abs(bk-ak) >= tol %hacer mientras no sealcance la toleracia deseada
    iter=iter+1;        %incrementar el contador de las iteraciones
    if fl>fm            %si la f(lamda)>f(miu)
        ak=lamdak;      %actualizar ak con lamda
        lamdak=miuk;    %actualizar labda con miu
        fl=fm;          %actualizar la evaluación de fl con fm 
        miuk=(1-gama)*ak+gama*bk; %calcular el nuevo miu
        fm=f(miuk);     %evaluar miu
    elseif fl<fm        %si la f(miu)>f(lamda)
        bk=miuk;        %actualizar el límite bk con miu
        miuk=lamdak;    %actualizar miu con el valor antiguo de lamda
        fm=fl;          %actualizar la evaluación de fm con fl
        lamdak=gama*ak+(1-gama)*bk; %calcular el nuevo lamda
        fl=f(lamdak);  %evaluar lamda con el nuevo
    end
    
    flamda(iter)=[fl]; %evaluación de la f(x)
    fmiu(iter)=[fm];   %evaluación de la f(x)
    D(iter,:)=[ak lamdak miuk bk]; %registro de los intervalos
    plot(lamdak, fl, '*b', miuk, fm, '*r')
    hold on
end
D
x=-3:0.1:5
y=x.^2+2*x;
iter
flamda'
fmiu'
plot(x,y)
hold on
        
        
        
    



