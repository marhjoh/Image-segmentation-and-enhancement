%% Predefined
% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Convert images to grayscale
img_flower_gray = rgb2gray(img_flower);
img_tiger_gray = rgb2gray(img_tiger);

% Set the number of clusters
K = 2;

%% K-means - segment the input image based on intensity values

img_flower_vector = img_flower_gray(:);
img_tiger_vector = img_tiger_gray(:);

[idx_flower, centers_flower] = kmeans(double(img_flower_vector), K);
[idx_tiger, centers_tiger] = kmeans(double(img_tiger_vector), K);

clustered_img_flower = reshape(idx_flower, size(img_flower_gray));
clustered_img_tiger = reshape(idx_tiger, size(img_tiger_gray));

%% K-means - segment the input image by using the cluster centers to assign new colors to the pixels.

% Perform K-means clustering on the images
[flower_labels, flower_centers] = kmeans(double(img_flower_gray(:)), K);
[tiger_labels, tiger_centers] = kmeans(double(img_tiger_gray(:)), K);

% Reshape the labels into an image
flower_seg_kmeans = reshape(flower_labels, size(img_flower_gray));
tiger_seg_kmeans = reshape(tiger_labels, size(img_tiger_gray));

%% Thresholding
threshold = 128; % Set the threshold value
binary_img_flower = img_flower_gray > threshold;
binary_img_tiger = img_tiger_gray > threshold;

%% Display output - image flower
% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_flower_gray); title('Original Image');
subplot(2,2,2); imshow(binary_img_flower); title('Thresholding');
subplot(2,2,3); imshow(clustered_img_flower, []); title('K-means Clustering');
subplot(2,2,4); imshow(flower_seg_kmeans, []); title('K-means Clustering');

%% Display output - image tiger
% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(binary_img_tiger); title('Thresholding');
subplot(2,2,3); imshow(clustered_img_tiger, []); title('K-means Clustering');
subplot(2,2,4); imshow(tiger_seg_kmeans, []); title('K-means Clustering');
