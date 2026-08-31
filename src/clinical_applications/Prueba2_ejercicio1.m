clear all; close all; clc

I = imread("noise.png");
I = double(I)/255;
I = rgb2gray(I);

%% Filtro 

sigma = 1.5;
k = round(3 * sigma);
[x, y] = meshgrid(-k:k, -k:k);

G = (1 / (2 * pi * sigma^2)) * exp(-(x.^2 + y.^2) / (2 * sigma^2));
G = G / sum(G(:));

[XI, YI] = size(I);
resultante = zeros(XI, YI);

for i = k + 1 : XI - k
    for j = k + 1 : YI - k
        ventana = I(i - k : i + k, j - k : j + k);
        resultante(i, j) = sum(sum(ventana .* G));
    end
end


%% Filtro 2
H = I;

media = median(median(H));
kernel1 = [1 0 1;0 1 0;1 0 1]*media;
[x,y] = size(H);

resultante1 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante1(i,j) = sum(sum(matriz1 .* kernel1));
    end
end


%% Resultados

subplot(1,3,1); figure(1); imshow(I); title("Original");
subplot(1,3,2); figure(1); imshow(resultante); title("Filtro Gaussiano");
subplot(1,3,3); figure(1); imshow(resultante1); title("Kernel Fila 1");