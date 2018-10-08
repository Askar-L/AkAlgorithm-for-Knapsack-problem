N=10;
K=3;
plantree=PlanTree( N);
planlist= CPL(plantree,N,K);
l = 0;
for i = 0 : K
    l = l + nchoosek(N,i);
end
%%
%Ak Test
    c = [10 20 30 32 40 50 55 60]';
    w = [1 10 20 22 30 40 45 55]';
    ca = 110;
    k = 8;
    tic
        [planlist,price]=AkMain( c , w , k , ca);
        disp(max(price));
    toc
%%
% Greedy Core Test
    c = [10 20 30 32 40 50 55 60]';
    w = [1 10 20 22 30 40 45 55]';
    ca = 110;
    n = length(c);
    s = c./w;
    s = [c w s];
    sortrows(s,-1);
    s = [s (1:n)'];
    disp(greedyCore( s , ca ));