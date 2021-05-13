function [ selected ] = simplerankingF( in_g1MCE ,dataset,MCE)
%SIMPLERANKINGF Summary of this function goes here
%   Detailed explanation goes here

g1mce=MCE(in_g1MCE);
[a b]=sort(g1mce,'descend');
selected=in_g1MCE(1,b);


end

