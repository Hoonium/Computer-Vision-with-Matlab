clear all;close all;
filename = 'circuit.tif';
f = imread(filename);

g = edge(f,'Canny');

[H, theta, rho] = hough(g, 'ThetaResolution', 0.2);
figure(1),imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
axis on, axis normal;
xlabel('\theta'),ylabel('\rho');

peaks = houghpeaks(H,5);
hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'linestyle','none','marker','s','color','g');
hold off;

lines = houghlines(g,theta,rho,peaks);
figure(2), imshow(g);
hold on;

for k = 1:length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth',4,'Color', 'r');
end

hold off;