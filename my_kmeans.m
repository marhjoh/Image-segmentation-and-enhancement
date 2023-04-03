function [clustered_img, centroids] = my_kmeans(img, K, tolerance)

% Convert the image to a vector
img_vector = double(img(:));

% Initialize the cluster centroids
centroids = rand(K, size(img_vector, 2));

% Initialize old_centroids
old_centroids = zeros(size(centroids));

% Iterate until convergence
while norm(centroids - old_centroids) >= tolerance
    % Update old centroids
    old_centroids = centroids;

    % Assign data points to clusters
    distances = pdist2(img_vector, centroids);
    [~, cluster_ids] = min(distances, [], 2);

    % Update centroids
    for i = 1:K
        centroids(i,:) = mean(img_vector(cluster_ids == i, :), 1);
    end
end

% Reshape the cluster ids into an image
clustered_img = reshape(cluster_ids, size(img));
end