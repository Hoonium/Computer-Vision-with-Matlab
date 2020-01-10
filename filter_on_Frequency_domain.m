clear all;
f = rgb2gray(imread('cat.jpeg'));
[R,C]=size(f);
r = R*2;
c = C*2;

F = fft2(f, r, c);
% F = abs(F);
Fc = fftshift(F);

h = fspecial('disk');
H = fftshift(fft2(h, r, c));
% H = zeros(size(Fc));
% H(3*r/8:5*r/8, 3*c/8:5*c/8) = ones;
Gc = H.*Fc;
G = ifftshift(Gc);
g = real(ifft2(G));
subplot(3,3,2);imshow(f);
subplot(3,3,4);imshow(mat2gray(abs(F)));
subplot(3,3,5);imshow(mat2gray(abs(Fc)));
subplot(3,3,6);imshow(H);
subplot(3,3,7);imshow(abs(Gc));
subplot(3,3,8);imshow(abs(G));
subplot(3,3,9);imshow(mat2gray(g(1:R,1:C)));