clear all; close all; clc

I = imread("cell.png");
G = rgb2gray(I);
HSV = rgb2hsv(I);

H = HSV(:,:,1);
S = HSV(:,:,2);
V = HSV(:,:,3);

subplot(1,3,1); figure(1); imshow(H); title("H")
subplot(1,3,2); figure(1); imshow(S); title("S")
subplot(1,3,3); figure(1); imshow(V); title("V")

figure(2); imshow(I);

%% Segmentacion

[x, y, z] = size(S);

N = zeros(x,y,"uint8");

B = zeros(x,y,"uint8");

for i=1:x
    for j=1:y
        N(i,j,1) = 0;
        N(i,j,2) = 0;
        N(i,j,3) = 0;
    end
end
for i=1:x
    for j=1:y
        if S(i,j) >= 0.66 && S(i,j) <= 0.67
            N(i,j,:) = G(i,j,1);
            B(i,j,:) = 0;
        elseif S(i,j) >= 0.50 && S(i,j) <= 0.83
            N(i,j,:) = I(i,j,:);
            B(i,j,:) = 255;
        elseif V(i,j) >= 0.87
            N(i,j,:) = I(i,j,:);
            B(i,j,:) = 255;
       
        else 
            N(i,j,1) = G(i,j,1);
            N(i,j,2) = G(i,j,1);
            N(i,j,3) = G(i,j,1);
            B(i,j,:) = 0;
        end
    end
end
figure(3); imshow(N); title("Segmentado");
figure(4); imshow(B); title("BIN");

%% Morfologicas


SE =  strel("disk",5);
B = imerode(B,SE);
SE2 = strel("disk",7);
B = imdilate(B,SE2);
B = imfill(B);


figure(5); imshow(B);
