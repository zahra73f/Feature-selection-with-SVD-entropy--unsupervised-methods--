function [ selected ] = newfowardsearch( indeex,dataset,MCE  )
%FOWARDSEARCH4 Summary of this function goes here
%   Detailed explanation goes here

r=size(indeex,2);
g1=MCE(indeex);
[a b]=max(g1);
featur1=indeex(b);
selected=indeex(b);
% t1=dataset;
% t1(:,featur1)=[];
rr=1;
while(rr~=r)
    rr
for i=1:size(dataset,2)
    if (ismember(i,selected))
        ent(i)=-1000;
    else
    x=[dataset(:,selected) dataset(:,i)];
    ent(i)=JointEntropy(x);
    
  
    
    end
    
end
[dd ind]=sort(ent,'descend');
index=ind(1,1:20);
calcu_ce=dataset(:,index);
temppp=dataset;
temppp(:,selected)=[];
en_x1=entropy_singular(temppp);
for i=1:10
    i
    aaa=find(ismember(temppp',calcu_ce(:,i)','rows'));
    temmp=temppp;
    temmp(:,aaa)=[];
    
    MCE20(i)=entropy_singular(temmp)-en_x1;
    CE20(i)=en_x1-entropy_singular(temmp);
    temmp=[];
end
[dd indd]=sort(CE20,'descend');
b1=index(indd(1,1));
selected=[selected,b1];
rr=rr+1;
end



end

