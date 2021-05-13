function [ en ] = entropy_singular( dataset )
%ENTROPY_SINGULAR Summary of this function goes here
%   Detailed explanation goes here

[m n r]=svd(dataset);
singular_value=diag(n);
temp=(singular_value.^2);
normalized_svxxt=temp./sum(temp);
N=rank(dataset);
temp2=normalized_svxxt(1:N).*log(normalized_svxxt(1:N));
en=-(1/log(N))*sum(temp2);
end

