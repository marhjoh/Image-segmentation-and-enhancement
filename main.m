%% Predefined

% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Set the thresholding segmentation parameter
threshold = 128;

% Define the number of clusters for K-means clustering
K = 2;

% Set the region growing parameters
threshold_for_region_growing = 8;

%% Thresholding
% Perform thresholding
binary_img_flower = my_thresholding(img_flower, threshold);
binary_img_tiger = my_thresholding(img_tiger, threshold);

%% K-means clustering
% Perform K-means clustering
[seg_kmeans_flower, centers1] = my_kmeans(img_flower, K);
[seg_kmeans_tiger, centers2] = my_kmeans(img_tiger, K);

% Convert the grayscale segmented images into color images
seg_kmeans_flower_color = label2rgb(seg_kmeans_flower);
seg_kmeans_tiger_color = label2rgb(seg_kmeans_tiger);

% Convert the color images to grayscale
kmeans_img_flower_gray = rgb2gray(seg_kmeans_flower_color);
kmeans_img_tiger_gray = rgb2gray(seg_kmeans_tiger_color);

%% Region-Growing 
% Apply the region growing segmentation
region_growing_tiger = my_region_growing(img_tiger, threshold_for_region_growing);
region_growing_flower = my_region_growing(img_flower, threshold_for_region_growing);

%% Display results
% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(binary_img_tiger); title('Thresholding');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(binary_img_flower); title('Thresholding');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(kmeans_img_tiger_gray); title('K-means Clustering');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(kmeans_img_flower_gray); title('K-means Clustering');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(region_growing_tiger, []); title('Region-Growing Segmentation');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(region_growing_flower, []); title('Region-Growing Segmentation');