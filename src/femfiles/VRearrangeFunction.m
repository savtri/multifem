function [ V ] = VRearrangeFunction( ConstVect,TotVal,NoKnDis )
%Define the Rearrange Matrix

V=zeros(TotVal);
j=TotVal-NoKnDis+1;
k=1;
for i=1:TotVal
    
    if     (ConstVect(i)==0)
        V(i,j)=1;
        j=j+1;
    elseif (ConstVect(i)==1)
        V(i,k)=1;
        k=k+1;
    end
    
end
end