%% Predefined

% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Set the thresholding segmentation parameter
threshold = 128;

% Define the number of clusters for K-means clustering
K = 2;

% Set the region growing parameters
threshold_for_region_growing = 10;

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

%% Image enhancement
% Perform histogram equalization and thresholding
img_flower_histeq = my_histeq(img_flower);
img_tiger_histeq = my_histeq(img_tiger);

% Thresholding
binary_img_flower_histeq = my_thresholding(img_flower_histeq, threshold);
binary_img_tiger_histeq = my_thresholding(img_tiger_histeq, threshold);

% K-means clustering
[seg_kmeans_flower_histeq, centers3] = my_kmeans(img_flower_histeq, K);
[seg_kmeans_tiger_histeq, centers4] = my_kmeans(img_tiger_histeq, K);

% Convert the grayscale segmented images into color images
seg_kmeans_flower_color_histeq = label2rgb(seg_kmeans_flower_histeq);
seg_kmeans_tiger_color_histeq = label2rgb(seg_kmeans_tiger_histeq);

% Convert the color images to grayscale
kmeans_img_flower_gray_histeq = rgb2gray(seg_kmeans_flower_color_histeq);
kmeans_img_tiger_gray_histeq = rgb2gray(seg_kmeans_tiger_color_histeq);

% Region-Growing 
% Apply the region growing segmentation
region_growing_tiger_histeq = my_region_growing(img_tiger_histeq, threshold_for_region_growing);
region_growing_flower_histeq = my_region_growing(img_flower_histeq, threshold_for_region_growing);

%% Display results
% Display the original images and the images after histogram equalization
figure;
subplot(2,4,1); imshow(img_tiger); title('Original Image');
subplot(2,4,2); imshow(rgb2gray(img_tiger)); title('Grayscale Original Image');
subplot(2,4,3); imshow(img_tiger_histeq); title('After Histogram Equalization');
subplot(2,4,4); imshow(rgb2gray(img_tiger_histeq)); title('Greyscale After Histogram Equalization');
subplot(2,4,5); imshow(img_flower); title('Original Image');
subplot(2,4,6); imshow(rgb2gray(img_flower)); title('Grayscale Original Image');
subplot(2,4,7); imshow(img_flower_histeq); title('After Histogram Equalization');
subplot(2,4,8); imshow(rgb2gray(img_flower_histeq)); title('Grayscale After Histogram Equalization');

% Display the original image and the segmented images
figure;
subplot(2,3,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,3,2); imshow(binary_img_tiger); title('Thresholding');
subplot(2,3,3); imshow(binary_img_tiger_histeq); title('After Histogram Equalization and Thresholding');
subplot(2,3,4); imshow(img_flower_gray); title('Original Image');
subplot(2,3,5); imshow(binary_img_flower); title('Thresholding');
subplot(2,3,6); imshow(binary_img_flower_histeq); title('After Histogram Equalization and Thresholding');

% Display the original image and the segmented images
figure;
subplot(2,3,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,3,2); imshow(kmeans_img_tiger_gray); title('K-means Clustering');
subplot(2,3,3); imshow(kmeans_img_tiger_gray_histeq); title('After Histogram Equalization and K-means Clustering');
subplot(2,3,4); imshow(img_flower_gray); title('Original Image');
subplot(2,3,5); imshow(kmeans_img_flower_gray); title('K-means Clustering');
subplot(2,3,6); imshow(kmeans_img_flower_gray_histeq); title('After Histogram Equalization and K-means Clustering');

% Display the original image and the segmented images
figure;
subplot(2,3,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,3,2); imshow(region_growing_tiger, []); title('Region-Growing Segmentation');
subplot(2,3,3); imshow(region_growing_tiger_histeq, []); title('After Histogram Equalization and Region Growing Segmentation');
subplot(2,3,4); imshow(img_flower_gray); title('Original Image');
subplot(2,3,5); imshow(region_growing_flower, []); title('Region-Growing Segmentation');
subplot(2,3,6); imshow(region_growing_flower_histeq, []); title('After Histogram Equalization and Region-Growing Segmentation');