function nSurface=GetElementSurfaces(itype)

switch itype    
    case 1  %Q4 Element
        nSurface=4;
    case 11 %Hex-Element
        nSurface=6;        
end
        


end