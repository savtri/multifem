function [theOpNode,nNodes]=Get_Op_Nodes(iType,aNode)

switch iType
    case 1
        nNodes=1;
        switch aNode
            case 1
                theOpNode(1,1)=3;
            case 2
                theOpNode(1,1)=4;
            case 3
                theOpNode(1,1)=1;
            case 4
                theOpNode(1,1)=2;
        end
    case 11
        nNodes=2;
        switch aNode
        case 1
            theOpNode(1,1)=7;
            theOpNode(2,1)=6;
        case 2
            theOpNode(1,1)=8;
            theOpNode(2,1)=5;
            case 3 
            theOpNode(1,1)=5;
            theOpNode(2,1)=8;
        case 4
            theOpNode(1,1)=6;
            theOpNode(2,1)=7;
            case 5
            theOpNode(1,1)=3;
            theOpNode(2,1)=2;
        case 6
            theOpNode(1,1)=4;
            theOpNode(2,1)=1;
        case 7 
            theOpNode(1,1)=1;
            theOpNode(2,1)=4;
        case 8
            theOpNode(1,1)=2;
            theOpNode(2,1)=3;
        end

end

   

end