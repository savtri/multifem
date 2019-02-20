function [aSurf, nSurf]=Get_Nodal_Surfaces(anElType,anod)

switch anElType
    case 1 %Q4 - 2 Surfaces per Node        
        nSurf=2;        
        switch anod
        case 1        
            aSurf(1)=1;
            aSurf(2)=4;
        case 2       
            aSurf(1)=1;
            aSurf(2)=2;
        case 3
            aSurf(1)=2;
            aSurf(2)=3;
        case 4        
            aSurf(1)=3;
            aSurf(2)=4;       
        end  
    case 11 %Hex-Element - 3 Surfaces Per node
        nSurf=3;        
        switch anod
        case 1        
            aSurf(1)=1;
            aSurf(2)=3;
            aSurf(3)=5;
        case 2       
            aSurf(1)=1;
            aSurf(2)=4;
            aSurf(3)=5;
        case 3
            aSurf(1)=2;
            aSurf(2)=4;
            aSurf(3)=5;
        case 4        
            aSurf(1)=2;
            aSurf(2)=3;
            aSurf(3)=5;
        case 5        
            aSurf(1)=1;
            aSurf(2)=3;
            aSurf(3)=6;
        case 6       
            aSurf(1)=1;
            aSurf(2)=4;
            aSurf(3)=6;
        case 7
            aSurf(1)=2;
            aSurf(2)=4;
            aSurf(3)=6;
        case 8        
            aSurf(1)=2;
            aSurf(2)=3;
            aSurf(3)=6;
        end          
end


end