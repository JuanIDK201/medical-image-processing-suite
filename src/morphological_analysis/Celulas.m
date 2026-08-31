%% Obtener imagen
clear all; close all; clc
I = imread("Prueba1_A.jpg");
G=rgb2gray(I);
[x y z] = size(I);
H=I;
D=I;
Y = I;

%% RGB fondo negro
H = I;
G1 = histeq(I);

for i=1:x
    for j=1:y
        H(i,j,1) = 0;
        H(i,j,2) = 0;
        H(i,j,3) = 0;
    end
end
for i=1:x
    for j=1:y
        if Y(i,j,1) >= 70 && Y(i,j,1) <= 100 && Y(i,j,2) >= 0 && Y(i,j,2) <= 30 && Y(i,j,3) >= 140 && Y(i,j,3) <= 155
            H(i,j,:) = Y(i,j,:);  
        else 
            H(i,j,1) = 0;

        end
    end
end
% G = histeq(G);
H=imbinarize(G,0.33);


SE=strel("diamond",1);
Q=imcomplement(H);
Q=imerode(Q,SE);

SE3=strel("disk",1);
Q=imerode(Q,SE3);

SE2=strel("disk",5);
Q=imdilate(Q,SE2);

F=imfill(Q,"holes");

figure(1) ; imshow(F)

B=regionprops(F,"Centroid");
centroids = cat(1,B.Centroid);
figure(2) ; imshow(I)

hold on
plot(centroids(:,1),centroids(:,2),'g*')
hold off