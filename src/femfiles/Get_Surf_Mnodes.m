function endNodes=Get_Surf_Mnodes(itype,iSurf)


switch itype
case 1 %Quadrilateral 
    switch iSurf
    case 1
        endNodes(1)=1;
        endNodes(2)=2;
    case 2
        endNodes(1)=2;
        endNodes(2)=3;
    case 3
        endNodes(1)=3;
        endNodes(2)=4;
    case 4
        endNodes(1)=4;
        endNodes(2)=1;
    end
case 11 %Hex-Element
    switch iSurf
    case 1
        endNodes(1)=1;
        endNodes(2)=5;
        endNodes(3)=6;
        endNodes(4)=2;
    case 2
        endNodes(1)=4;
        endNodes(2)=3;
        endNodes(3)=7;
        endNodes(4)=8;
    case 3
        endNodes(1)=1;
        endNodes(2)=5;
        endNodes(3)=8;
        endNodes(4)=4;
    case 4
        endNodes(1)=2;
        endNodes(2)=6;
        endNodes(3)=7;
        endNodes(4)=3;
    case 5
        endNodes(1)=1;
        endNodes(2)=2;
        endNodes(3)=3;
        endNodes(4)=4;
    case 6
        endNodes(1)=5;
        endNodes(2)=6;
        endNodes(3)=7;
        endNodes(4)=8;
    end
end

end