clear all; close all; clc
I = imread("Conteo de células\cel1.png");
G = rgb2gray(I);
% G = histeq(G);
[x, y, z] = size(I);
H = I;
%figure(1);imshow(G);
TH=graythresh(G);
B=imbinarize(G,TH+0.025);
%figure(2);imshow(B);

B2 = imcomplement(B);

%% Operaciones morfologicas
% imerode (erosion)
% imdilate (dilatacion)
% imclose (dilatacion y luego erosion)
% imopen (erosion y luego dilatacion)


SE =  strel("disk",2);
N = imerode(B2,SE);
SE2 = strel("octagon",3);
D = imerode(N,SE2);
SE3 = strel("diamond",2);
D = imdilate(D,SE3);
D = imfill(D,"holes");


%% Centroides

C=regionprops(D,"Centroid");
centroids = cat(1,C.Centroid);
figure(4); imshow(D);
hold on
plot(centroids(:,1),centroids(:,2),'b*')
hold off


