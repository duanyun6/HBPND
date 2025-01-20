function [out_img,key] = encrypt(img,times)


img = double(img);
[h,w,d]=size(img);
key=zeros(1,32);
for i=1:d
    key=key+double(hash(double(img(:,:,i)),'SHA-256'));
end
key=mod(key,256);

%Hyperchaotic systems produce pseudo-random sequences
initSequence = [0.01,0.01,0.01,0.01,0.01,0.01];
key_array=generate_init(key,initSequence);
step = 0.01;
pnum=ceil((h+w+d*8)/6);
[t,K] = rossler([0:step:(pnum+h*w/2+5000-1)*step],1e-5,1e-5,key_array);
K(1:5000,:)=[];

%3D bit-level scrambling
img=permutation(img,K(1:pnum,:));
%Noise diffusion
out_img = diffusion(img,K(pnum+1:end,:),times);


end


