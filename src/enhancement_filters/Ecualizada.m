clear all; close all; clc %#ok<CLALL>
Y = imread("Endoscopía\End_1.png");

I = rgb2gray(Y);

[x, y, z] = size(Y);


%%Ecualizada

imhist(I);
H = I;
G1 = histeq(I);

for i=1:x
    for j=1:y
        H(i,j,1) = 0;
        H(i,j,2) = 0;
        H(i,j,3) = 0;
    end
end
for i=7:425
    for j=89:514
        if G1(i,j,1) >= 69 && G1(i,j,1) <= 140
            H(i,j,:) = Y(i,j,:);
        else 
            H(i,j,1) = 0;
            H(i,j,2) = 0;
            H(i,j,3) = 0;
        end
    end
end

subplot(2,2,1); imshow(H); title("Ecualizada");


%%Solo Grises

I = rgb2gray(Y);

[x y z] = size(Y);

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

subplot(2,2,2); imshow(H); title("Escala Grises");

%%RGB

I = imread("Endoscopía\End_1.png");

G = rgb2gray(I);

[x y z] = size(I);
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
subplot(2,2,3); imshow(H); title("RGB");
subplot(2,2,4); imshow(Y); title("Original");
