clear all; close all; clc

Y = imread("Muñeca\Fracture\34 Male (A View).jpg");
I = imnoise(Y,"gaussian");
I = double(I)/255;
I = rgb2gray(I);
figure(1); imshow(I);


%% Filtro Gaussiano
sigma = 1;
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


%% Enfoque
kernel3 = [-2,-1,0;-1,1,1;0,1,2];

[x,y] = size(resultante);

resultante3 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz3 = resultante(i-1:i+1, j-1:j+1);
        resultante3(i,j) = sum(sum(matriz3 .* kernel3));
    end
end


subplot(1,3,1); figure(2); imshow(I); title("Ruido")
subplot(1,3,2); figure(2); imshow(resultante); title("Filtrada")
subplot(1,3,3); figure(2); imshow(resultante3); title("Enfocada")