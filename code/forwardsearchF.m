function [selected,selected3,selected4] = forwardsearchF( indeex,dataset,MCE )
%FORWARDSEARCHF Summary of this function goes here
%   Detailed explanation goes here
r=size(indeex,2);
g1=MCE(indeex);
[a b]=max(g1);
featur1=indeex(b);
selected=indeex(b);
% selected2=indeex(b);
selected3=indeex(b);
selected4=indeex(b);
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
%     if (ismember(i,selected2))
%         ent2(i)=-1000;
%     else
%     x=[dataset(:,selected2) dataset(:,i)];
%     ent2(i)=0.25*JointEntropy(x)+0.75*CE(1,i);
%   
%     
%     end
    if (ismember(i,selected3))
        ent3(i)=-1000;
    else
    x=[dataset(:,selected3) dataset(:,i)];
    ent3(i)=0.75*JointEntropy(x)+0.25*MCE(1,i);
  
    
    end
    if (ismember(i,selected4))
        ent4(i)=-1000;
    else
    x=[dataset(:,selected4) dataset(:,i)];
    ent4(i)=0.25*JointEntropy(x)+0.75*MCE(1,i);
  
    
    end
    x=[];
end
[a1 b1]=max(ent);
% [a2 b2]=max(ent2);
[a3 b3]=max(ent3);
[a4 b4]=max(ent4);
ent=[];
ent2=[];
ent3=[];
ent4=[];
% selected2=[selected2,b2];
selected3=[selected3,b3];
selected4=[selected4,b4];
selected=[selected,b1];
rr=rr+1;
end




end

