function [ planlist,price] = AkMain( c , w , K , CA)
%AKMAIN 此处显示有关此函数的摘要
%    w: weight
%    ca: capacity
%    k: level
    try
        N = length(c);
        s = c./w;
        s = [c w s];
        sortrows(s,-1);
        s = [s (1:N)'];
%         if (k < 0)||( floor(k)~=k)
%             disp('k needs to be integra and positive');
%         end
    catch err
        disp(err);    
    end
    try
         plantreeroot = PlanTree(N);
         planlist= CPL(plantreeroot,N,K);
    catch err 
        disp(err)
    end
    cores = feature('numCores');%获取核心数
    if isempty(gcp('nocreate'))
%         pp=parpool(cores);
    end
    mission = length(planlist);
    %/cores
    price = zeros(mission,1);
    for missionNum = 1 : mission 
        planlist{missionNum} = strfind(planlist{missionNum}, '1');
    end
    %for missionNum = 10 : 10
    for missionNum = 1 : mission 
        out = planlist{missionNum};
        offset = 0;
        ca = CA;
        in = s;
        for j =1:length(out)
            if( ca - in(out(j)-offset,2) ) >= 0
                ca = ca - in(out(j)-offset,2);
                price(missionNum) = price(missionNum) + in(out(j)-offset,1);
                in(out(j)-offset,:) = [];
                offset = offset+1;
            end
        end
        if offset == length(out)
            price(missionNum) = greedyCore( in , ca ) + price(missionNum);
        else
            price(missionNum)=0;
        end
    end
end

