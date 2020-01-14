clear all;
filename = 'cat.jpeg';
f = rgb2gray(imread(filename));

th = graythresh(f);
th_otsu = otsuthresh(f);



g = im2bw(f,th);
g_otsu = im2bw(f,th_otsu);
% g_locol = locolthresh(f);
% g_moving = movingthresh(f);

subplot(3,2,1) = imshow(f);
subplot(3,2,3) = imshow(g);
subplot(3,2,4) = imshow(g_otsu);
% subplot(3,2,5) = imshow(g_locol);
% subplot(3,2,6) = imshow(g_moving);


