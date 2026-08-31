clear all; close all; clc

I = imread("Muñeca\Fracture\4 Male (L View).jpg");
I = double(I)/255;
H = rgb2gray(I);
kernel1 = [1,1,1;1,1,1;1,1,1];

figure(1); imshow(H);


%% kernels diferentes
[x,y] = size(H);

resultante1 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante1(i,j) = mean(mean(matriz1 .* kernel1));
    end
end

%figure(2); imshow(resultante1);
subplot(1,2,1); figure(3); imshow(H); title("Original")
subplot(1,2,2); figure(3); imshow(resultante1); title("Kernel")


%% Filtro a la desenfocada

kernel2 = [0,-1,0;-1,5,-1;0,-1,0];

[x,y] = size(resultante1);

resultante2 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz2 = I(i-1:i+1, j-1:j+1);
        resultante2(i,j) = sum(sum(matriz2 .* kernel2));
    end
end

%figure(2); imshow(resultante1);
subplot(1,3,1); figure(4); imshow(H); title("Original")
subplot(1,3,2); figure(4); imshow(resultante1); title("Desenfocada")
subplot(1,3,3); figure(4); imshow(resultante2); title("Kernel")

%%  Filtro de repujado (Da relieve, textura)

kernel3 = [-2,-1,0;-1,1,1;0,1,2];

[x,y] = size(H);

resultante3 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz3 = I(i-1:i+1, j-1:j+1);
        resultante3(i,j) = sum(sum(matriz3 .* kernel3));
    end
end

%figure(2); imshow(resultante1);
subplot(1,2,1); figure(4); imshow(H); title("Original")
subplot(1,2,2); figure(4); imshow(resultante3); title("Kernel")