clear all;

filename = 'cat.jpeg';

color_image = imread(filename);
gray_image = rgb2gray(color_image);

f = gray_image;

g_salt_pepper = imnoise(f,'salt & pepper');
g_gaussian = imnoise(f,'gaussian');

w = fspecial('average');
r1 = imfilter(g_salt_pepper,w);
r2 = imfilter(g_gaussian,w);
r3 = medfilt2(g_salt_pepper,[7 7], 'symmetric');
r4 = medfilt2(g_gaussian,[7 7],'symmetric');
r5 = adpmedian(g_salt_pepper,5);
r6 = adpmedian(g_salt_pepper,5);

subplot(4,2,1); imshow(g_salt_pepper);
subplot(4,2,2); imshow(g_gaussian);
subplot(4,2,3); imshow(r1);
subplot(4,2,4); imshow(r2);
subplot(4,2,5); imshow(r3);
subplot(4,2,6); imshow(r4);
subplot(4,2,7); imshow(r5);
subplot(4,2,8); imshow(r6);
