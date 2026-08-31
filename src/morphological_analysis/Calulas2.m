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
 
figure(1); imshow(H2); title("RGB");

%% Areas
G = rgb2gray(H2);
B=imbinarize(G,0.3);
figure(2);imshow(B);

SE=strel("disk",2);
Q=imerode(B,SE);

SE2=strel("disk",1);
Q=imdilate(Q,SE2);


Q=imfill(Q,"holes");

figure(3) ; imshow(Q)
F = Q;
J=regionprops(F,"Area","Centroid");
centroids = cat(1,J.Centroid);

list_areas = cat(1,J.Area);
num_areas = length(list_areas);

verdes = 0;
azules = 0;
rojas = 0;

hold on

for i =1:num_areas
    if list_areas(i) >= 800 && list_areas(i) <= 2800
        plot(centroids(i,1),centroids(i,2),'g*',MarkerSize=15)
        verdes = verdes+1;
    elseif list_areas(i) >= 2800 && list_areas(i) <= 3000
        plot(centroids(i,1),centroids(i,2),'B*',MarkerSize=15)
        azules = azules+1;
    elseif list_areas(i) >= 4500
        plot(centroids(i,1),centroids(i,2),'r*',MarkerSize=15)
        rojas = rojas+1;
    end
end

Total = verdes + azules*2 + rojas*3;


%% Watershed
J=regionprops(B,"Area");

list_areas = cat(1,J.Area);

for i=1:length(list_areas)
        if list_areas(i) < 100
            Q(i,j,:) = 0;
        else
            Q(i,j,:) = 1;   
        end
end

figure(6); imshow(Q);


D = -bwdist(~Q); 

D(~Q) = -Inf; 
L = watershed(D);

Q(L == 0) = 0; 

figure(5); imshow(label2rgb(L, 'jet', 'w')); title('Watershed');

objetos = bwconncomp(F);

J=regionprops(Q,"Area","Centroid");
centroids = cat(1,J.Centroid);

list_areas = cat(1,J.Area);
num_areas = length(list_areas);

verdes = 0;
azules = 0;
rojas = 0;

hold on

for i =1:num_areas
    if list_areas(i) >= 500 && list_areas(i) <= 2800
        plot(centroids(i,1),centroids(i,2),'g*',MarkerSize=15)
        verdes = verdes+1;
    elseif list_areas(i) >= 2800
        plot(centroids(i,1),centroids(i,2),'r*',MarkerSize=15)
        rojas = rojas+1;
    end
end

Total_Watershed = verdes + rojas;
