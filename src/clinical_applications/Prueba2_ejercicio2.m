clear all; close all; clc

I = imread("RMI_tumor.png");
I = double(I)/255;
I = rgb2gray(I);

%% Filtro Gaussiano

sigma = 2.2;
k = round(3 * sigma);
[x, y] = meshgrid(-k:k, -k:k);

G = (1 / (2 * pi * sigma^2)) * exp(-(x.^2 + y.^2) / (2 * sigma^2));
G = G / sum(G(:));

[XI, YI] = size(I);
resultanteG = zeros(XI, YI);

for i = k + 1 : XI - k
    for j = k + 1 : YI - k
        ventana = I(i - k : i + k, j - k : j + k);
        resultanteG(i, j) = sum(sum(ventana .* G));
    end
end


%% Laplace
kernel = [1,1,1;1,-8,1;1,1,1];

[x,y] = size(I);

resultante = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz = resultanteG(i-1:i+1, j-1:j+1);
        resultante(i,j) = sum(sum(matriz .* kernel));
    end
end

BIN = imbinarize(resultante, 0.01);


%% Resultados
subplot(1,2,1); figure(1); imshow(I); title("Original");
subplot(1,2,2); figure(1); imshow(BIN); title("Resultante");