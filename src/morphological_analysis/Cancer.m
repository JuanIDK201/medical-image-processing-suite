clear all; close all; clc;


folderPath = 'human_ht29_colon_cancer_1_images'; 
filePattern = fullfile(folderPath, '*.tif');

archivos = dir(filePattern);
totales_por_imagen = zeros(length(archivos), 1);

for k = 1:length(archivos)
    baseFileName = archivos(k).name;
    fullFileName = fullfile(folderPath, baseFileName);
        
    Y = imread(fullFileName);

    [x, y, z] = size(Y);
    TH = graythresh(Y);
    BIN = imbinarize(Y,TH-0.1);
    %figure(1); imshow(BIN);
    
     
    %% Areas
    SE=strel("disk",1);
    Q=imerode(BIN,SE);
    
    SE2=strel("disk",1);
    Q=imdilate(Q,SE2);
    
    
    Q=imfill(Q,"holes");
    
    %figure(2) ; imshow(Q)
    
    
    %% Watershed
    
    D = -bwdist(~Q); 
    
    D(~Q) = -Inf; 
    L = watershed(D);
    
    Q(L == 0) = 0; 
    
    subplot(2,3,k); imshow(Y); title(k)
    
    
    J=regionprops(Q,"Area","Centroid");
    centroids = cat(1,J.Centroid);
    
    list_areas = cat(1,J.Area);
    num_areas = length(list_areas);
    Total_Watershed = 0;
    
    
    hold on
    
    for i =1:num_areas
        if list_areas(i) >= 7
            plot(centroids(i,1),centroids(i,2),'g*',MarkerSize=5)
            Total_Watershed = Total_Watershed + 1;
        end
    end
    totales_por_imagen(k) = Total_Watershed;
end
