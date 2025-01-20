function o_img= decrypt(eimg,key,times)

eimg = double(eimg);
[h,w,d]=size(eimg);

%Hyperchaotic systems produce pseudo-random sequences
initSequence = [0.01,0.01,0.01,0.01,0.01,0.01];
key_array=generate_init(key,initSequence);
step = 0.01;
pnum=ceil((h+w+d*8)/6);
[t,K] = rossler([0:step:(pnum+h*w/2+5000-1)*step],1e-5,1e-5,key_array);
K(1:5000,:)=[];
%Noise dediffusion
o_img = dediffusion(eimg,K(pnum+1:end,:),times);
%3D bit-level scrambling
o_img = depermute(o_img,K(1:pnum,:));
o_img = uint8(o_img);
end

