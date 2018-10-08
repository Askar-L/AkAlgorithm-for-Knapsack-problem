function [ thispoint ] = planPoint( N ,level , act , AH )
%UNTITLED5 此处显示有关此函数的摘要
%   act : 1 if this point qctive
%   AH : (int)all history , shows how many points is active before (include this point)
    data = [ level act AH ];
    if level <= N
        left = planPoint( N , level+1 , 0 , AH+0 );
        right = planPoint( N , level+1 , 1, AH+1 );
        thispoint = {left right data};
    else
        thispoint = cell(0);
    end
end

