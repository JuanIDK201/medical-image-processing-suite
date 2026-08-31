clear all; close all; clc

I = imread("brain.jpg");
I = double(I)/255;
H = rgb2gray(I);
kernel1 = [1,1,1;1,1,1;1,1,1];

figure(1); imshow(H);


%% Filtro Laplaciano

kernel = [0,1,0;1,-4,1;0,1,0];

[x,y] = size(H);

resultante = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz = I(i-1:i+1, j-1:j+1);
        resultante(i,j) = sum(sum(matriz .* kernel));
    end
end

BIN = imbinarize(resultante, 0.05);
subplot(2,2,1); figure(2); imshow(H); title("Original")
subplot(2,2,2); figure(2); imshow(resultante); title("Kernel")
subplot(2,2,3); figure(2); imshow(BIN); title("Binarizada")