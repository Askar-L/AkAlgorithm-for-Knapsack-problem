function [ planlist ] = innerCPL(planlist,root,K,plan)
    if ~isempty(root{1,1})
        plan(end+1) = '0';
        planlist = innerCPL(planlist,root{1},K , plan);
        plan(end) = '1';
        planlist = innerCPL(planlist,root{2},K,plan);
    else
        if root{3}(3) <= K
            planlist{end+1} = plan;
        end
    end

end