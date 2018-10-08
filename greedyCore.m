function [c] = greedyCore( in , ca ) 
% indicator
        % in = [c w s]
% capacity
    [a,b] = size(in);
    in = [in zeros(a,1)];
    c = 0;
    for i = 1 : a

        if in( i , 2 ) <= ca
            in(i,4) = 1;
            ca = ca - in( i , 2 );
            c = c + in(i,1);
        end
        
    end
    
end

