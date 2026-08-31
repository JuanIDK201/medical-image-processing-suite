clear all; close all; clc;


Y = imread("Prueba1_B.jpg");

I = rgb2gray(Y);


[x, y, z] = size(Y);

H = I;
H2 = I;
G1 = histeq(I);
BIN = imbinarize(G1,0.4);

%% Binaria

for i=1:x
    for j=1:y
        H(i,j,1) = 0;
        H(i,j,2) = 0;
        H(i,j,3) = 0;
    end
end
for i=1:x
    for j=1:y
        if BIN(i,j,1) == 1
            H(i,j,:) = 0;
        else
            H(i,j,:) = Y(i,j,:);   
        end
    end
end

%% RGB
for i=1:x
    for j=1:y
        if Y(i,j,1) >= 190 && Y(i,j,1) <= 225  && Y(i,j,2) >= 150 && Y(i,j,2) <= 200 && Y(i,j,3) >= 200 && Y(i,j,3) <= 255
            H2(i,j,:) = 0;
        elseif Y(i,j,1) >= 190 && Y(i,j,1) <= 255  && Y(i,j,2) >= 80 && Y(i,j,2) <= 175 && Y(i,j,3) >= 200 && Y(i,j,3) <= 255
            H2(i,j,1) = Y(i,j,1);
            H2(i,j,2) = Y(i,j,2);
            H2(i,j,3) = Y(i,j,3);
        elseif Y(i,j,1) >= 130 && Y(i,j,1) <= 230  && Y(i,j,2) >= 10 && Y(i,j,2) <= 90 && Y(i,j,3) >= 140 && Y(i,j,3) <= 240
            H2(i,j,1) = Y(i,j,1);
            H2(i,j,2) = Y(i,j,2);
            H2(i,j,3) = Y(i,j,3);
        else
            H2(i,j,:) = 0;   
        end
    end
end
 
subplot(1,2,1); figure(1); imshow(H2); title("RGB");
subplot(1,2,2); figure(1); imshow(H); title("Binaria");