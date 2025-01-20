clc;
clear;
close all;

path='./baboon.tiff';

img=imread(path);
[h,w,d]=size(img);
figure(1);
imshow(img);
title("Plaintext-image");

[e_img,key]=encrypt(img,1600);  
figure(2);
imshow(e_img);
title("Encryption-image");



d_img=decrypt(e_img,key,1600);
figure(3);
imshow(d_img);
title("Decryption-image");
