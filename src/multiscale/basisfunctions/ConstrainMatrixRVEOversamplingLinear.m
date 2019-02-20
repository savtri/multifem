function [ Constrains ] = ConstrainMatrixRVEOversamplingLinear( i,InputMultiscaleIndex )
Constrains=ones(InputMultiscaleIndex.DegreeOfFreedomCoarseMicro,1);
n1=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(1,1);
n2=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(2,1);
n3=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(3,1);
n4=InputMultiscaleIndex.NumberOfMicroBoundaryInternalNodes(4,1);
if i==1
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
    h=5;
    for j=1:n2
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+2+j,1)-1;
        h=h+1;
    end
    for j=1:n3
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+3+j,1)-1;
        h=h+1;
    end
    for j=1:size(c,1)
        Constrains(c(j,1))=0;
    end
elseif i==2
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
    h=5;
    for j=1:n2
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+2+j,1);
        h=h+1;
    end
    for j=1:n3
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+3+j,1);
        h=h+1;
    end
    for j=1:size(c,1)
        Constrains(c(j,1))=0;
    end
elseif i==3
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    h=5;
    for j=1:n3
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+3+j,1)-1;
        h=h+1;
    end
    for j=1:n4
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+n3+4+j,1)-1;
        h=h+1;
    end
    for j=1:size(c,1)
        Constrains(c(j,1))=0;
    end
elseif i==4    
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    h=5;
    for j=1:n3
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+3+j,1);
        h=h+1;
    end
    for j=1:n4
        c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+n3+4+j,1);
        h=h+1;
    end
    for j=1:size(c,1)
        Constrains(c(j,1))=0;
    end
elseif i==5
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1)-1;
        h=5;
        for j=1:n1
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(1+j,1)-1;
            h=h+1;
        end
        for j=1:n4
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+n3+4+j,1)-1;
            h=h+1;
        end
        for j=1:size(c,1)
             Constrains(c(j,1))=0;
        end    
elseif i==6    
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(4,1);
        h=5;
        for j=1:n1
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(1+j,1);
            h=h+1;
        end
        for j=1:n4
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+n2+n3+4+j,1);
            h=h+1;
        end
        for j=1:size(c,1)
             Constrains(c(j,1))=0;
        end 
elseif i==7
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1)-1;
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1)-1;
    h=5;
        for j=1:n1
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(1+j,1)-1;
            h=h+1;
        end
        for j=1:n2
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+2+j,1)-1;
            h=h+1;
        end
        for j=1:size(c,1)
             Constrains(c(j,1))=0;
        end    
elseif i==8    
    c(1,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1)-1;
    c(2,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(2,1);
    c(3,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(1,1);
    c(4,1)=2*InputMultiscaleIndex.IndexXYMacroBoundaryNodes(3,1);
    h=5;
        for j=1:n1
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(1+j,1);
            h=h+1;
        end
        for j=1:n2
            c(h,1)=2*InputMultiscaleIndex.IndexXYMicroBoundaryNodes(n1+2+j,1);
            h=h+1;
        end
        for j=1:size(c,1)
             Constrains(c(j,1))=0;
        end     
end
end

