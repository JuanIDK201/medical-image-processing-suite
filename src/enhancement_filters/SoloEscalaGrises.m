clear all; close all; clc
Y = imread("Endoscopía\End_1.png");

I = rgb2gray(Y);

[x y z] = size(Y);
figure(1); imshow(Y);
figure(2); imshow(I);


%%Segmentacion Rojo
H = I;

for i=1:x
    for j=1:y
        H(i,j,1) = 0;
        H(i,j,2) = 0;
        H(i,j,3) = 0;
    end
end
for i=7:425
    for j=89:514
        if I(i,j,1) >= 180 && I(i,j,1) <= 255
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        else 
            H(i,j,:) = Y(i,j,:);
        end
    end
end

figure(3); imshow(H);