clear all; close all; clc;

% original = rgb2gray(imread('cat.jpeg'));
% original = rgb2gray(imread('bunny_0034.ppm'));

color_original = imread('bunny_0034.ppm');
bin_original = imread('bunny_bin_0034.pgm');
bin_original = ~im2bw(bin_original);
original = double(color_original).* double(bin_original);
original = mat2gray(original);
original = rgb2gray(original);
imshow(original);

% scale = 0.7;
% J = imresize(original,scale);
% 
% theta = 30;
% 
% distorted = imrotate(J,theta);
% distorted = rgb2gray(imread('bunny_0035.ppm'));

color_distorted = imread('bunny_0035.ppm');
bin_distorted = imread('bunny_bin_0035.pgm');
bin_distorted = ~im2bw(bin_distorted);
distorted = double(color_distorted) .* double(bin_distorted);
distorted = mat2gray(distorted);
distorted = rgb2gray(distorted);
figure, imshow(distorted);

ptsOriginal = detectSURFFeatures(original);
ptsDistorted = detectSURFFeatures(distorted);


[featuresOriginal, validPtsOriginal] = extractFeatures(original, ptsOriginal);
[featuresDistorted, validPtsDistorted] = extractFeatures(distorted,ptsDistorted);

indexPairs = matchFeatures(featuresOriginal, featuresDistorted);

matchedOriginal = validPtsOriginal(indexPairs(:,1));
matchedDistorted = validPtsDistorted(indexPairs(:,2));

figure;
showMatchedFeatures(original,distorted,matchedOriginal,matchedDistorted);

[tform, inlierDistorted, inlierOriginal] = estimateGeometricTransform(matchedDistorted, matchedOriginal, 'similarity');
legend('ptsOriginal','ptsDistorted');

Tinv = tform.invert.T;

ss = Tinv(2,1);
sc = Tinv(1,1);
scaleRecovered = sqrt(ss*ss + sc*sc);
thetaRecovered = atan2(ss,sc)*180/pi;

outputView = imref2d(size(original));
recovered = imwarp(distorted,tform,'OutputView',outputView);

figure, imshowpair(original,recovered,'montage');