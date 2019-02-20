function XYZ=Get_Element_Coords(Coords,Index,iType)


XYZ(1,:)=Coords(Index,2);
XYZ(2,:)=Coords(Index,3);
      
if iType==11
    XYZ(3,:)=Coords(Index,4);
end


end