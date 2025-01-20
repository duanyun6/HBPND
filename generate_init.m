function [array]=generate_init(key,t)

key=double(key);    
K=abs(key);
c1=t(1);c2=t(2);c3=t(3);c4=t(4);c5=t(5);c6=t(6);

h1=double(abs(typecast(uint8(key(1:4)),'single')));
h2=double(abs(typecast(uint8(key(5:8)),'single')));
h3=double(abs(typecast(uint8(key(9:12)),'single')));
h4=double(abs(typecast(uint8(key(13:16)),'single')));
h5=double(abs(typecast(uint8(key(17:20)),'single')));
h6=double(abs(typecast(uint8(key(21:24)),'single')));
h7=double(abs(typecast(uint8(key(25:28)),'single')));
h8=double(abs(typecast(uint8(key(29:32)),'single')));
maxx=max([h1,h2,h3,h4,h5,h6,h7,h8]);
x1=(h1+h2)/maxx+c1;
x2=(h3+h4)/maxx+c2;
x3=(h5+h6)/maxx+c3;
x4=(h7+h8)/maxx+c4;
x5=(h1+h3+h5+h7)/maxx+c5;
x6=(h2+h4+h6+h8)/maxx+c6;


array=[x1,x2,x3,x4,x5,x6];
