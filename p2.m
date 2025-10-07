close all;
clear all;
clc;
 
p= 25;            %no of database images
testno =10;     %no of test images
T = 0.7;
 
tic 
A = zeros(2500,1);
 
    path = '1P_1.tif';
    im = imread(path);
    bw = im2gray(im);
    re = imresize(bw,[256,256]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    A = reshape(r,65536,1);
for i = 2 : p
    path = '';
    path = strcat(int2str(i),'P_1.tif');
    im = imread(path);
    bw = im2gray(im);
    re = imresize(bw,[256,256]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    A = [A,reshape(r,65536,1)];
    
end
 
B = zeros(2500,1)
 
    path = '';
    path ='1P_4.tif'
    im = imread(path);
    bw = im2gray(im);
    re = imresize(bw,[256,256]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    B = reshape(r,65536,1);
 
for i = 2 : testno
    path = '';
    path = strcat(int2str(i),'P_4.tif');
    im = imread(path);
    bw = im2gray(im);
    re = imresize(bw,[256,256]);
    y = fft2(re);
    z = abs(y);
    r = double(z);
    B = [B,reshape(r,65536,1)];
   
end
 
 
 
x = A;
y = B;
 
[nx mx] = size(x);
[ny my] = size(y);
 
for j = 1 : my
    path = '';
path = strcat(int2str(j),'P_4.tif');
    im=imread(path);
    figure(j);
    subplot(1,2,1); imshow(path); 
    title('Testing Image');
    for i = 1 : mx
        d = y(:,j)-x(:,i);
        dis1 = sqrt(d'*d);
        disty(i) = dis1;
    end
    disty
    dmin = min(disty)
    k = find(disty == dmin)
    if size(k,2)~=1
        k=min(k);
    end
    fstr=strcat(int2str(k),'P_1.tif');
    figure(j); subplot(1,2,2); imshow(fstr);
    title('Image from the database');
       
end
toc


