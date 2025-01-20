function recoverImg = depermute(img,K)
%Produces a random sequence in three directions
[h,w,d]=size(img);

[kh,kw]=size(K);
I=reshape(dec2bin(img,8),h,w,d*8);
Kx=reshape(K,kh*kw,1);
kx=Kx*100-round(Kx*100,0);
k1=abs(kx(1:h));
k2=abs(kx(h+1:h+w));
k3=abs(Kx(h+w+1:h+w+d*8));

order1=gen_order(k1,h);
order2=gen_order(k2,w);
order3=gen_order(k3,d*8);
%Front scrambling
T=I;
matrix=char(zeros(h,w,d*8));
for i=1:h
    matrix(order1(i),:,:)=T(i,:,:);   
end
%Side scrambling
T=matrix;
for i=1:w
    matrix(:,order2(i),:)=T(:,i,:);   
end
%Top scrambling
T=matrix;
for i=1:d*8
    matrix(:,:,order3(i))=T(:,:,i);   
end
%Restore a 3D matrix to an image
recoverImg=uint8(reshape(bin2dec(reshape(matrix,h*w*d,8)),h,w,d));

end

