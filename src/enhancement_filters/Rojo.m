clear all; close all; clc
I = imread("Endoscopía\End_1.png");

G = rgb2gray(I);

[x y z] = size(I);
figure(1); imshow(I);
figure(2); imshow(G);


%%Segmentacion Rojo
H = I;

for i=1:x
    for j=1:y
        if I(i,j,1) >= 240 && I(i,j,1) <= 255 && I(i,j,2) >= 165 && I(i,j,2) <= 190 && I(i,j,3) >= 120 && I(i,j,3) <= 160
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        elseif I(i,j,1) >= 240 && I(i,j,1) <= 255 && I(i,j,2) >= 90 && I(i,j,2) <= 190 && I(i,j,3) >= 60 && I(i,j,3) <= 160
            H(i,j,:) = I(i,j,:);
        else 
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        end
    end
end

figure(3); imshow(H);