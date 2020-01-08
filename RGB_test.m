clear all;
filename = 'cat.jpeg';
k=0;

color_image = imread(filename);
[R,C,X] = size(color_image);

row = 1:R;
col = 1:C;

red_channel = color_image(row,col,1);
green_channel = color_image(row,col,2);
blue_channel = color_image(row,col,3);

cyan_image(R,C) = zeros;
magenta_image(R,C) = zeros;
yellow_image(R,C) = zeros;

for i = 1:R
    for j = 1:C
        cyan_image(i,j) = 255.0 - double(red_channel(i,j));
        magenta_image(i,j) = 255.0 - double(green_channel(i,j));
        yellow_image(i,j) = 255.0 - double(blue_channel(i,j));
    end
end


figure(1);
subplot(4,3,2); imshow(filename);

subplot(4,3,4); imshow(red_channel);
subplot(4,3,5); imshow(green_channel);
subplot(4,3,6); imshow(blue_channel);

subplot(4,3,7); imshow(mat2gray(cyan_image));
subplot(4,3,8); imshow(mat2gray(magenta_image));
subplot(4,3,9); imshow(mat2gray(yellow_image));


[H,S,V] = rgb2hsv(color_image);

subplot(4,3,10); imshow(H);
subplot(4,3,11); imshow(S);
subplot(4,3,12); imshow(V);

while(1)
    
    k=menu('RGB','exit');
    
    if k ~=1
        
        
    else
        break;
    end
end

close all;