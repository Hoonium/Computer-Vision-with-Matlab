clear all;
filename = 'circuit.tif';

%  color_image = imread(filename);
% gray_image = rgb2gray(color_image);

f=imread(filename);

g1 = edge(f,'Sobel');
g2 = edge(f,'Prewitt');
g3 = edge(f,'Roberts');
g4 = edge(f,'log');
g5 = edge(f,'zerocross');
g6 = edge(f,'Canny');
g7 = edge(f,'approxcanny');

subplot(3,3,1:2); imshow(f);
subplot(3,3,3); imshow(g1);
subplot(3,3,4); imshow(g2);
subplot(3,3,5); imshow(g3);
subplot(3,3,6); imshow(g4);
subplot(3,3,7); imshow(g5);
subplot(3,3,8); imshow(g6);
subplot(3,3,9); imshow(g7);