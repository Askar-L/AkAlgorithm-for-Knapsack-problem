function [ planlist ] = CPL(root,N,K)
% generate plan list
%   each mission shows as a vector
    planlist = {};
    plan='';
    planlist=innerCPL(planlist,root,K,plan);
end

