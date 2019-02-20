function Nodes = GetElementNodes(anElement)

itype=anElement(1,2);

switch itype
    case 1 %Q4 element                                                
        Nodes=anElement(3:6);                    
    case 11 %Hex-Element
        Nodes=anElement(3:10);        
end



end

