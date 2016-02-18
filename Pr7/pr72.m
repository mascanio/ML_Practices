A = double(imread ("bird_small.png" )) / 255;

res = reshape (A, 128*128,3);
iniCent = randomCentroids(res, 16);

[centroids, idx] = runkMeans(res, iniCent , 10, false);

X = centroids(idx',:);

sol(:,:,1) = reshape (X(:,1), 128,128);
sol(:,:,2) = reshape (X(:,2), 128,128);
sol(:,:,3) = reshape (X(:,3), 128,128);

imagesc(sol);
