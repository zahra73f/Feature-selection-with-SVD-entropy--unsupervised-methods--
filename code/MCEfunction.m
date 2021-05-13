function [ MCE,CE ] = MCEfunction( dataset,selected )
%CEFUNCTION Summary of this function goes here
%   Detailed explanation goes here
temp10=dataset;
temp11=dataset;
temp10(:,selected)=[];
temp11(:,selected)=0;
en_x=entropy_singular(temp10);
for i=1:size(dataset,2)
    i
    if (ismember(i,selected))
        MCE(i)=-1000;
        CE(i)=-1000;
    else
    temp=temp11;
    temp(:,i)=[];
    temp(:,all(temp == 0))=[];
    ent_singfeaturs(i)=entropy_singular(temp);
    MCE(i)=entropy_singular(temp)-en_x;
    CE(i)=en_x-entropy_singular(temp);
    temp=[];
end

end

