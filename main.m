% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Define the number of clusters for K-means clustering
K = 2;

% Set the tolerance for convergence
tolerance = 1e-5;

% Perform thresholding
threshold = 128; % Set the threshold value
binary_img_flower = my_thresholding(img_flower, threshold);
binary_img_tiger = my_thresholding(img_tiger, threshold);

% Call my_kmeans
[clustered_img_flower, centroids_tiger] = my_kmeans(img_flower_gray, K, tolerance);
[clustered_img_tiger, centroids_flower] = my_kmeans(img_tiger_gray, K, tolerance);

% Perform k-means segmentation
segmented_img_flower = kmeans_segmentation(img_flower, K, tolerance);
segmented_img_tiger = kmeans_segmentation(img_tiger, K, tolerance);

% Perform K-means clustering
[flower_seg_kmeans, flower_centers] = kmeans_segmentation_colors(img_flower_gray, K);
[tiger_seg_kmeans, tiger_centers] = kmeans_segmentation_colors(img_tiger_gray, K);

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(binary_img_tiger); title('Thresholding');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(binary_img_flower); title('Thresholding');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(clustered_img_tiger, []); title('K-means Clustering');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(clustered_img_flower, []); title('K-means Clustering');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(segmented_img_tiger); title('K-means Segmentation');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(segmented_img_flower); title('K-means Segmentation');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(tiger_seg_kmeans); title('K-means Segmentation');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(flower_seg_kmeans); title('K-means Segmentation');