I = imread("Muñeca\Fracture\34 Male (A View).jpg");
I = double(I)/255;
H = rgb2gray(I);
kernel1 = [1,0,-1;1,0,-1;1,0,-1];
kernel2 = [-1,0,1;-1,0,1;-1,0,1];
kernel3 = [1,1,1;0,0,0;-1,-1,-1];
kernel4 = [-1,-1,-1;0,0,0;1,1,1];

figure(1); imshow(H);


%% kernels diferentes
[x,y] = size(H);

resultante1 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante1(i,j) = sum(sum(matriz1 .* kernel1));
    end
end

resultante2 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz2 = I(i-1:i+1, j-1:j+1);
        resultante2(i,j) = sum(sum(matriz2 .* kernel2));
    end
end

resultante3 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz3 = I(i-1:i+1, j-1:j+1);
        resultante3(i,j) = sum(sum(matriz3 .* kernel3));
    end
end

resultante4 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz4 = I(i-1:i+1, j-1:j+1);
        resultante4(i,j) = sum(sum(matriz4 .* kernel4));
    end
end

subplot(1,4,1);figure(2);imshow(resultante1); title("[1,0,-1;1,0,-1;1,0,-1]");
subplot(1,4,2);figure(2);imshow(resultante2); title("[-1,0,1;-1,0,1;-1,0,1]");
subplot(1,4,3);figure(2);imshow(resultante3); title("[1,1,1;0,0,0;-1,-1,-1]");
subplot(1,4,4);figure(2);imshow(resultante4); title("[-1,-1,-1;0,0,0;1,1,1]");

%% Mean
resultante7 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante7(i,j) = mean(mean(matriz1 .* kernel1));
    end
end

%% Max

resultante5 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante5(i,j) = max(max(matriz1 .* kernel1));
    end
end

%% Min

resultante6 = zeros(x,y);

for i=2:x-1
    for j=2:y-1
        matriz1 = I(i-1:i+1, j-1:j+1);
        resultante6(i,j) = min(min(matriz1 .* kernel1));
    end
end


subplot(1,4,1);figure(3);imshow(resultante1); title("SUM");
subplot(1,4,2);figure(3);imshow(resultante7); title("MEAN");
subplot(1,4,3);figure(3);imshow(resultante5); title("MAX");
subplot(1,4,4);figure(3);imshow(resultante6); title("MIN");