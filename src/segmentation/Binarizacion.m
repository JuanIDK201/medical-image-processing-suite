clear all; close all; clc
I = imread("Endoscopía\Endoscopía.jpg");

G = rgb2gray(I);

[x, y, z] = size(I);
figure(1); imshow(I);
figure(2); imshow(G);


%%Binarizacion
H = G;
K = G;

for i=1:x
    for j=1:y
        if G(i,j,1) >= 100 && G(i,j,1) <= 135
            H(i,j) = 0;
            K(i,j) = 255;
        else 
            H(i,j) = 255;
            K(i,j) = 0;
        end
    end
end


subplot(1,2,1); imshow(H); title("Negro");
subplot(1,2,2); imshow(K); title("Negativo");