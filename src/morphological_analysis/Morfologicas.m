clear all; close all; clc
I = imread("Celulas\Conteo de células\cel1.png");
G = rgb2gray(I);
% G = histeq(G);
[x, y, z] = size(I);
H = I;
D = I;
figure(1);imshow(G);
TH=graythresh(G);
B=imbinarize(G,TH+0.025);
figure(2);imshow(B);

B2 = imcomplement(B);

F = imfill(B2,"holes");
figure(3);imshow(F);

J=regionprops(F,"Area","Centroid");
centroids = cat(1,J.Centroid);
imshow(F)


list_areas = cat(1,J.Area);
num_areas = length(list_areas);

verdes = 0;
azules = 0;
rojas = 0;
MAG = 0;

for i =1:num_areas
    if list_areas(i) >= 1000 && list_areas(i) <= 2500
        hold on
        plot(centroids(i,1),centroids(i,2),'g*',MarkerSize=15)
        verdes = verdes+1;
    elseif list_areas(i) >= 2500 && list_areas(i) <= 3000
        plot(centroids(i,1),centroids(i,2),'B*',MarkerSize=15)
        azules = azules+1;
    elseif list_areas(i) >= 3000 && list_areas(i) <= 4500
        plot(centroids(i,1),centroids(i,2),'r*',MarkerSize=15)
        rojas = rojas+1;
    elseif list_areas(i) >= 4500
        plot(centroids(i,1),centroids(i,2),'M*',MarkerSize=15)
        MAG = MAG+1;
    end
end

Total = verdes + azules*2 + rojas*3 + MAG*4;
