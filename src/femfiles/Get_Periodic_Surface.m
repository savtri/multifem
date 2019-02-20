function aSurf=Get_Periodic_Surface(iSurf,iType)
% Returns the "periodic" of  a given coarse element surface
switch iType
    case 1 %Quad
        switch iSurf
            case 1
                aSurf=3;
            case 2
                aSurf=4;
            case 3
                aSurf=1;
            case 4
                aSurf=2;
        end
    case 11
        switch iSurf
            case 1
                aSurf=2;
            case 2
                aSurf=1;
            case 3
                aSurf=4;
            case 4
                aSurf=3;
            case 5
                aSurf=6;
            case 6
                aSurf=5;
        end                
end




end