function  F=fsolve_obj_AppliedDisplacements2DRVE(x,xyzm,xyzM)
F=zeros(2,1);
F(1)=xyzm(1,1)-((1/4)*(1-x(1))*(1-x(2))*xyzM(1,1)+(1/4)*(1+x(1))*(1-x(2))*xyzM(2,1)+(1/4)*(1+x(1))*(1+x(2))*xyzM(3,1)+(1/4)*(1-x(1))*(1+x(2))*xyzM(4,1));
F(2)=xyzm(1,2)-((1/4)*(1-x(1))*(1-x(2))*xyzM(1,2)+(1/4)*(1+x(1))*(1-x(2))*xyzM(2,2)+(1/4)*(1+x(1))*(1+x(2))*xyzM(3,2)+(1/4)*(1-x(1))*(1+x(2))*xyzM(4,2));
end

