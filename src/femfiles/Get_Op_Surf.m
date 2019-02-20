function [aSurf,nSurf]=Get_Op_Surf(iType,inod)


switch iType
    case 1 % Q4
        nSurf=2;
        aSurf=zeros(2,1);
        switch inod
            case 1
                aSurf(1,1)=2;
                aSurf(2,1)=3;
            case 2
                aSurf(1,1)=3;
                aSurf(2,1)=4;                
            case 3
                aSurf(1,1)=4;
                aSurf(2,1)=1;
            case 4
                aSurf(1,1)=1;
                aSurf(2,1)=2;                
        end
    case 11 %Hex
        nSurf=3;
        aSurf=zeros(3,1);
        switch inod
            case 1
                aSurf(1,1)=2;
                aSurf(2,1)=4;
                aSurf(3,1)=6;
            case 2
                aSurf(1,1)=2;
                aSurf(2,1)=3;
                aSurf(3,1)=6;
            case 3
                aSurf(1,1)=1;
                aSurf(2,1)=3;
                aSurf(3,1)=6;                
            case 4
                aSurf(1,1)=1;
                aSurf(2,1)=4;
                aSurf(3,1)=6;                
            case 5
                aSurf(1,1)=2;
                aSurf(2,1)=4;
                aSurf(3,1)=5;                                
            case 6
                aSurf(1,1)=2;
                aSurf(2,1)=3;
                aSurf(3,1)=5;                                
            case 7
                aSurf(1,1)=1;
                aSurf(2,1)=3;
                aSurf(3,1)=5;                                
            case 8
                aSurf(1,1)=1;
                aSurf(2,1)=4;
                aSurf(3,1)=5;                                
        end                    
end


end