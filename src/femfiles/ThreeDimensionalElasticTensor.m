function [ De ] = ThreeDimensionalElasticTensor( E,v )
De=zeros(6,6);


De(1,1)=(1-v)*E/((1+v)*(1-2*v));
De(1,2)=v*E/((1+v)*(1-2*v));
De(1,3)=v*E/((1+v)*(1-2*v));
%
De(2,1)=v*E/((1+v)*(1-2*v));
De(2,2)=(1-v)*E/((1+v)*(1-2*v));
De(2,3)=v*E/((1+v)*(1-2*v));
%
De(3,1)=v*E/((1+v)*(1-2*v));
De(3,2)=v*E/((1+v)*(1-2*v));
De(3,3)=(1-v)*E/((1+v)*(1-2*v));
%
G=E/(2*(1+v));
%
De(4,4)=G;
De(5,5)=G;
De(6,6)=G; 




end
