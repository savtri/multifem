function  F=fsolve_obj_AppliedDisplacements3DRVE(x,xyzm,xyzM)
F=zeros(3,1);


[ShapeFunction,DerivativesOfShapeFunction] =Get_Element_Shape_Functions(x(1), x(2), x(3),11);

F(1)=xyzm(1,1)-ShapeFunction'*xyzM(:,1);
F(2)=xyzm(1,2)-ShapeFunction'*xyzM(:,2);
F(3)=xyzm(1,3)-ShapeFunction'*xyzM(:,3);

end