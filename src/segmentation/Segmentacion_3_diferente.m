clear all; close all; clc
I = imread("Luis.jpeg");

[x y z] = size(I);
figure(1); imshow(I);

%% Inspeccion de cada pixel
H = I;

for i=1:x
    for j=1:y
        H(i,j,1) = I(i,j,1);
        H(i,j,2) = I(i,j,1);
        H(i,j,3) = I(i,j,1);
    end
end

for k= 645:960
    for h = 309:715
        if I(h,k,1) >= 130 && I(h,k,1) <= 255 && I(h,k,2) >= 0 && I(h,k,2) <= 80 && I(h,k,3) >= 0 && I(h,k,3) <= 70
            H(h,k,:) = I(h,k,:);
        elseif I(h,k,1) >= 150 && I(h,k,1) <= 220 && I(h,k,2) >= 150 && I(h,k,2) <= 255 && I(h,k,3) >= 60 && I(h,k,3) <= 210
            H(h,k,:) = I(h,k,:);
        elseif I(h,k,2) >= 30 && I(h,k,2) <= 255 && I(h,k,1) >= 0 && I(h,k,1) <= 50 && I(h,k,2) >= 50 && I(h,k,2) <= 170
            H(h,k,:) = I(h,k,:);
        else 
            H(h,k,1) = I(h,k,1);
            H(h,k,2) = I(h,k,1);
            H(h,k,3) = I(h,k,1);
        end
    end
end

figure(2); imshow(H);