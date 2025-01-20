function o_img = diffusion(en_img,K,times)
[h,w,d]=size(en_img);
o_img = double(en_img);
%Generated noise matrix
fK=zeros(h*w/2,6);
for i =1:6
    maxx=max(K(:,i));minx=min(K(:,i));
    temp=(  2*K(:,i)  - (maxx+minx)  )/(maxx-minx);
    fK(:,i) = mod(floor((abs(temp)-floor(abs(temp)))*10^10),256);
end
noise1 = reshape(fK(1:h*w/2,:), h, w ,d);


%Set weight
Alpha=0.9961;
Beta=1-Alpha;

N1=Beta*noise1;
N=zeros(h,w,d);


%Multiple iterations of noise diffusion
for i=1:times      
    o_img=ceil(Alpha*o_img);
    N=Alpha*N+N1;
end

o_img=o_img+N;
o_img=mod(int32(o_img),256);
o_img = uint8(o_img);