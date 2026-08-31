clear all; close all; clc
Y = imread("Endoscopía\End_1.png");

I = rgb2gray(Y);

[x y z] = size(Y);
figure(1); imshow(Y);
figure(2); imshow(I);


%%Segmentacion Rojo

imhist(I);
H = I;
G1 = histeq(I);
imhist(G1);

for i=1:x
    for j=1:y
        H(i,j,1) = 0;
        H(i,j,2) = 0;
        H(i,j,3) = 0;
    end
end
for i=7:425
    for j=89:514
        if Y(i,j,1) >= 240 && Y(i,j,1) <= 255 && Y(i,j,2) >= 150 && Y(i,j,2) <= 190 && Y(i,j,3) >= 120 && Y(i,j,3) <= 175
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        elseif Y(i,j,1) >= 240 && Y(i,j,1) <= 255 && Y(i,j,2) >= 90 && Y(i,j,2) <= 190 && Y(i,j,3) >= 60 && Y(i,j,3) <= 160
            H(i,j,:) = Y(i,j,:);
        elseif I(i,j,1) >= 180 && I(i,j,1) <= 200
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        
        else 
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        end
    end
end

figure(3); imshow(H);
figure(4); imshow(G1);