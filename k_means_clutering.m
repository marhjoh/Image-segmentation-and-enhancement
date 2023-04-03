% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Convert the images to grayscale
img_flower_gray = rgb2gray(img_flower);
img_tiger_gray = rgb2gray(img_tiger);

% Define the number of clusters for K-means clustering
K = 2;

% Convert the image to a vector
img_vector = double(img_tiger_gray(:));

% Initialize the cluster centroids
centroids = rand(K, size(img_vector, 2));

% Initialize old_centroids
old_centroids = zeros(size(centroids));

% Set the maximum number of iterations and convergence threshold
max_iter = 100;
tolerance = 1e-5;

for iter = 1:max_iter
    % Assign data points to clusters
    distances = pdist2(img_vector, centroids);
    [~, cluster_labels] = min(distances, [], 2);
    
    % Update cluster centroids
    for k = 1:K
        centroids(k, :) = mean(img_vector(cluster_labels == k, :), 1);
    end
    
    % Check for convergence
    if norm(centroids - old_centroids) < tolerance
        break
    end
    
    % Update old centroids
    old_centroids = centroids;
end

% Assign cluster labels to pixels in the image
clustered_img = reshape(cluster_labels, size(img_tiger_gray));

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,2); imshow(clustered_img, []); title('K-means Clustering');