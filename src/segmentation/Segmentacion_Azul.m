clear all; close all; clc
I = imread("Luis.jpeg");

[x y z] = size(I);
figure(1); imshow(I);

%% Inspeccion de cada pixel
H = I;

for i=1:x
    for j=1:y
        if I(i,j,2) >= 30 && I(i,j,2) <= 255 && I(i,j,1) >= 0 && I(i,j,1) <= 50 && I(i,j,2) >= 50 && I(i,j,2) <= 170
            H(i,j,:) = I(i,j,:);
        else
            H(i,j,1) = I(i,j,1);
            H(i,j,2) = I(i,j,1);
            H(i,j,3) = I(i,j,1);
        end
    end
end

figure(2); imshow(H);