function v=Print_Check(sumN,itype,nDofs,ivector)

CheckParam = 0.001 ;

switch itype
    case 1 %Q4 coarse         
        for i=1:nDofs:size(sumN,1)        
            sumNxx=sumN(i,1);
            %
            if abs(sumNxx-1)>=CheckParam
                disp('Error in Basis Function Nxx, not equal to 1')
                disp('Error in Macro Shape Function:')
                disp(i);
                sumNxx
                stop
            end            
            
            if ivector==1
                sumNyx=sumN(i,2);
                sumNyy=sumN(i+1,2);                    
            %  
                if abs(sumNyy-1)>=CheckParam
                    disp('Error in Basis Function Nyy, not equal to 1')
                    disp('Error in line:')
                    disp(i+1);
                    sumNyy
                 stop
                end                                       
                if abs(sumNyx)>=CheckParam
                    disp('Error in Basis Function Nyx, not equal to 0')
                    disp('Error in line:')
                    disp(i+1);
                    sumNyx
                    stop
                end
            end
        end        
    case 11 %Hex coarse
        for i=1:nDofs:size(sumN,1)              
            sumNxx=sumN(i,1);     
            %  
            if abs(sumNxx-1)>=CheckParam
                disp('Error in Basis Function Nxx, not equal to 1')
                disp('Error in line:')
                disp(i);
                sumNxx
                stop
            end
            
            if ivector==1
                sumNyx=sumN(i,2);
                sumNxz=sumN(i,3);
                sumNyy=sumN(i+1,2);
                sumNyz=sumN(i+1,3);
                sumNzz=sumN(i+2,3);  
                %
                if abs(sumNyy-1)>=CheckParam
                    disp('Error in Basis Function Nyy, not equal to 1')
                    disp('Error in line:')
                    disp(i+1);
                    sumNyy
                 stop
                end
                if abs(sumNyx)>=CheckParam
                    disp('Error in Basis Function Nxy, not equal to 0')
                    disp('Error in line:')
                    disp(i);
                    sumNxy
                    stop
                end
                if abs(sumNxz)>=CheckParam
                    disp('Error in Basis Function Nxz, not equal to 0')
                    disp('Error in line:')
                    disp(i);
                    sumNxz
                    stop
                end                
                if abs(sumNzz-1)>=CheckParam
                    disp('Error in Basis Function Nyz, not equal to 0')
                    disp('Error in Macro Shape Function:')
                    disp(i+1);
                    sumNzz
                    stop
                end                  
            end
        end
end        
        
        
        
    
        
        
        
end