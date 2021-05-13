% X = ceil(repmat([2 4 8 16],[1e3,1]) .* rand(1e3,4));
% v=Entropy(X);
% dataset=importdata('COIL20.txt');
% data=load('GLIOMA.mat');
% dataset=data.GLIOMA;
% data=load('Colon.mat');
% dataset=data.X;
% data=load('ORL.mat');
% dataset=data.ORL;
% data= load('BreastCancerWisconsin.mat');
% dataset=data.BreastCancerWisconsin;
data=load('PCMAC.mat');
dataset=data.PCMAC;
dataset=dataset(:,1:end-1);
en_x=entropy_singular(dataset);
for i=1:size(dataset,2)
    i
    temp=dataset;
    temp(:,i)=[];
%     ent_singfeaturs(i)=entropy_singular(temp);
    MCE(i)=entropy_singular(temp)-en_x;
%     CE(i)=en_x-entropy_singular(temp);
end
% c=mean(CE);
% s=std(CE);
c2=mean(MCE);
s2=std(MCE);
in_g1MCE=find(MCE>(c2+s2));
in_g2MCE=find(MCE>(c2-s2) & MCE<(c2+s2));
in_g3MCE=find(MCE<(c2-s2));
% in_g1=find(CE>(c+s));
% in_g2=find(CE>(c-s) & CE<(c+s));
% in_g3=find(CE<(c-s));
selected_SR_MCE=simplerankingF( in_g1MCE ,dataset,MCE);
[selected_fs1,selected_fs2,selected_fs3] = forwardsearchF( in_g1MCE,dataset,MCE );
SE_SR_MCE=SErrorF( selected_SR_MCE,dataset );
SE_FS1_MCE=SErrorF( selected_fs1,dataset );
SE_FS2_MCE=SErrorF( selected_fs2,dataset );
SE_FS3_MCE=SErrorF( selected_fs3,dataset );
selected_newfs=newfowardsearch( in_g1MCE,dataset,MCE );
SE_SR_MCE=SErrorF( selected_SR_MCE,dataset );
SE_FS1_MCE=SErrorF( selected_fs1,dataset );
SE_FS2_MCE=SErrorF( selected_fs2,dataset );
SE_FS3_MCE=SErrorF( selected_fs3,dataset );
SE_NEWFS_MCE=SErrorF( selected_newfs,dataset );

selected_fsarticle=FSarticle( in_g1MCE,MCE,dataset );

% g1=CE(in);

% group2=CE(CE>(c-s) & CE<(c+s));
% group3=CE(CE<(c-s));