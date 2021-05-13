function [ SE ] = SErrorF( selected,dataset )
%SERRORF Summary of this function goes here
%   Detailed explanation goes here
newdimention_data=dataset(:,selected);
D = pdist(dataset);
Z = squareform(D);
dis_orig=sum(sum(Z))/2;
dis1=triu(Z);
D2 = pdist(newdimention_data);
Z2 = squareform(D2);
dis2=triu(Z2);
dis_redim=sum(sum(Z2))/2;
t4=(dis1-dis2)./dis1;
t4(isnan(t4))=0;
t3=sum(sum(t4));
SE=(1/dis_orig)*t3;

end

