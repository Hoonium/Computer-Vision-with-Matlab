I = rgb2gray(imread('cat.jpeg'));

corners = detectHarrisFeatures(I);
[features, valid_corners] = extractFeatures(I,corners);

figure(1); imshow(I); hold on;

plot(valid_corners);

points = detectSURFFeatures(I);
[features, valid_points] = extractFeatures(I,points);

figure(2); imshow(I); hold on;
plot(valid_points.selectStrongest(10),'showOrientation',true);