clear all; clc;
filename = 'cat.jpeg';

color_image = imread(filename);
gray_image = rgb2gray(color_image);

V= double(gray_image);
[R,C] = size(gray_image);

embossing_image1(R,C)=zeros;

bluring33_gray_image(R,C)=zeros;

bluring55_gray_image(R,C)=zeros;

sharp_image(R,C)=zeros;

for i=1:R-2
    for j = 1:C-2
        embossing_image1(i+1,j+1) = V(i,j)*(-1.0) + V(i+2,j+2);
    end
end

for i=1:R-2
    for j = 1:C-2
        for i_=0:2
            for j_=0:2
                bluring33_gray_image(i+1,j+1) = bluring33_gray_image(i+1,j+1) + V(i+i_,j+j_)/9;
            end
        end
                %bluring33_gray_image(i+1,j+1) = V(i,j)/9+V(i,j+1)/9+V(i,j+2)/9+V(i+1,j)/9+V(i+1,j+1)/9+V(i+1,j+2)/9+V(i+2,j)/9+V(i+2,j+1)/9+V(i+2,j+2)/9;
    end
end

for i=1:R-4
    for j = 1:C-4
        for i_=0:4
            for j_=0:4
                bluring55_gray_image(i+1,j+1) = bluring55_gray_image(i+1,j+1) + V(i+i_,j+j_)/25;
            end
        end
                %bluring33_gray_image(i+1,j+1) = V(i,j)/9+V(i,j+1)/9+V(i,j+2)/9+V(i+1,j)/9+V(i+1,j+1)/9+V(i+1,j+2)/9+V(i+2,j)/9+V(i+2,j+1)/9+V(i+2,j+2)/9;
    end
end

for i=1:R-2
    for j = 1:C-2
        sharp_image(i+1,j+1) = V(i,j)*(-1.0)+V(i,j+1)*(-1.0)+V(i,j+2)*(-1.0)+V(i+1,j)*(-1.0)+V(i+1,j+1)*(9.0)+V(i+1,j+2)*(-1.0)+V(i+2,j)*(-1.0)+V(i+2,j+1)*(-1.0)+V(i+2,j+2)*(-1.0);
    end
end

subplot(2,2,1);imshow(color_image);
subplot(2,2,2);imshow(gray_image);

while(1)
    k = menu('Filter','Embossing','33Bluring','55Bluring','sharpning','exit')

    switch k
        case 1
            subplot(2,2,3:4);imshow(mat2gray(embossing_image1));
        case 2
            subplot(2,2,3:4);imshow(mat2gray(bluring33_gray_image));
        case 3
            subplot(2,2,3:4);imshow(mat2gray(bluring55_gray_image));
        case 4
            subplot(2,2,3:4);imshow(mat2gray(sharp_image));
        case 5
            break
    end
end

close all;