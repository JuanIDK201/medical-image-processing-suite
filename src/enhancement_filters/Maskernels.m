clear all; close all; clc

I = imread("brain.jpg");
I = double(I)/255;
H = rgb2gray(I);
kernel1 = [1,1,1;1,1,1;1,1,1];

figure(1); imshow(H);


%% 

kernel = [1,1,1;1,-2,1;-1,-1,-1];

[x,y] = size(H);

resultante = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz = I(i-1:i+1, j-1:j+1);
        resultante(i,j) = sum(sum(matriz .* kernel));
    end
end

kernel1 = [-1,1,1;-1,-2,1;-1,1,1];

[x,y] = size(H);

resultante1 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante1(i,j) = sum(sum(matriz1 .* kernel1));
    end
end

BIN = imbinarize(resultante, 0.15);
BIN1 = imbinarize(resultante1, 0.15);
subplot(2,2,1); figure(2); imshow(resultante); title("Horizontal")
subplot(2,2,2); figure(2); imshow(resultante1); title("Vertical")
subplot(2,2,3); figure(2); imshow(BIN); title("Binarizada Horizontal")
subplot(2,2,4); figure(2); imshow(BIN1); title("Binarizada Vertical")

%% Invertido

kernel3 = [-1,-1,-1;1,-2,1;1,1,1];

[x,y] = size(H);

resultante3 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz3 = I(i-1:i+1, j-1:j+1);
        resultante3(i,j) = sum(sum(matriz3 .* kernel3));
    end
end

kernel4 = [1,1,-1;1,-2,-1;1,1,-1];

[x,y] = size(H);

resultante4 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz4 = I(i-1:i+1, j-1:j+1);
        resultante4(i,j) = sum(sum(matriz4 .* kernel4));
    end
end

BIN2 = imbinarize(resultante, 0.15);
BIN3 = imbinarize(resultante1, 0.15);
subplot(2,2,1); figure(2); imshow(resultante3); title("Horizontal Invertido")
subplot(2,2,2); figure(2); imshow(resultante4); title("Vertical Invertido")
subplot(2,2,3); figure(2); imshow(BIN2); title("Binarizada Horizontal Invertido")
subplot(2,2,4); figure(2); imshow(BIN3); title("Binarizada Vertical Invertido")

%% Comparacion

subplot(2,2,1); figure(2); imshow(resultante); title("Horizontal")
subplot(2,2,2); figure(2); imshow(resultante1); title("Vertical")
subplot(2,2,3); figure(2); imshow(resultante3); title("Horizontal Invertido")
subplot(2,2,4); figure(2); imshow(resultante4); title("Vertical Invertido")
