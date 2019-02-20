function DofsPerNode = GetDofsPerNode(itype)


switch itype
    case 1  %Q4 element
        DofsPerNode=2;      
    case 11 %3Q8 element
        DofsPerNode=3;      
end


end