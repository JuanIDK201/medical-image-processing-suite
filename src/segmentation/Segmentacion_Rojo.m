clear all; close all; clc
I = imread("Luis.jpeg");

[x y z] = size(I);
figure(1); imshow(I);

%% Inspeccion de cada pixel
H = I;

for i=1:x
    for j=1:y
        if I(i,j,1) >= 130 && I(i,j,1) <= 255 && I(i,j,2) >= 0 && I(i,j,2) <= 80 && I(i,j,3) >= 0 && I(i,j,3) <= 70
            H(i,j,:) = I(i,j,:);
        else 
            H(i,j,1) = I(i,j,1);
            H(i,j,2) = I(i,j,1);
            H(i,j,3) = I(i,j,1);
        end
    end
end

figure(2); imshow(H);