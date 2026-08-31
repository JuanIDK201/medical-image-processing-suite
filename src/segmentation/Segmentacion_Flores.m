clear all; close all; clc
I = imread("Imágenes RGB\rgb.jpg");

[x y z] = size(I);
figure(1); imshow(I);

%% Inspeccion de cada pixel
H = I;

for i=1:x
    for j=1:y
        if I(i,j,1) >= 50 && I(i,j,1) <= 255 && I(i,j,2) >= 5 && I(i,j,2) <= 100 && I(i,j,3) >= 2 && I(i,j,3) <= 80
            H(i,j,:) = I(i,j,:);
        elseif I(i,j,1) >= 220 && I(i,j,1) <= 255 && I(i,j,2) >= 80 && I(i,j,2) <= 160 && I(i,j,3) >= 100 && I(i,j,3) <= 130
            H(i,j,:) = I(i,j,:);
        elseif I(i,j,1) >= 220 && I(i,j,1) <= 255 && I(i,j,2) >= 80 && I(i,j,2) <= 160 && I(i,j,3) >= 70 && I(i,j,3) <= 130
            H(i,j,:) = I(i,j,:);
        elseif I(i,j,1) >= 200 && I(i,j,1) <= 255 && I(i,j,2) >= 110 && I(i,j,2) <= 200 && I(i,j,3) >= 100 && I(i,j,3) <= 200
            H(i,j,:) = I(i,j,:);
        else 
            H(i,j,1) = I(i,j,1);
            H(i,j,2) = I(i,j,1);
            H(i,j,3) = I(i,j,1);
        end
    end
end

figure(2); imshow(H);