function [ selected ] = FSarticle( in_g1MCE,MCE1,dataset )
%FSARTICLE Summary of this function goes here
%   Detailed explanation goes here

r=size(in_g1MCE,2);
g1=MCE1(in_g1MCE);
[a b]=max(g1);
featur1=in_g1MCE(b);
selected=in_g1MCE(b);
% t1=dataset;
% t1(:,featur1)=[];
rr=1;
while(rr~=r)
    rr
    
    [MCE ,CE]=MCEfunction(dataset,selected);
  
    [a1 b1]=max(MCE);
    MCE=[];
    selected=[selected,b1];
    rr=rr+1;
end



end

