% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Define the number of clusters for K-means clustering
K = 2;

% Perform thresholding
threshold = 128; % Set the threshold value
binary_img_flower = my_thresholding(img_flower, threshold);
binary_img_tiger = my_thresholding(img_tiger, threshold);

% Perform K-means clustering
[seg_kmeans_flower, centers1] = my_kmeans(img_flower, K);
[seg_kmeans_tiger, centers2] = my_kmeans(img_tiger, K);

% Convert the grayscale segmented images into color images
seg_kmeans_flower_color = label2rgb(seg_kmeans_flower);
seg_kmeans_tiger_color = label2rgb(seg_kmeans_tiger);

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(binary_img_tiger); title('Thresholding');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(binary_img_flower); title('Thresholding');

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(seg_kmeans_tiger_color, []); title('K-means Clustering');
subplot(2,2,3); imshow(img_flower_gray); title('Original Image');
subplot(2,2,4); imshow(seg_kmeans_flower_color, []); title('K-means Clustering');