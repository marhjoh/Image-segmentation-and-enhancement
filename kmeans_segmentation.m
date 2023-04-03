function segmented_img = kmeans_segmentation(img, K, tolerance)
    % Convert the image to grayscale
    img_gray = rgb2gray(img);

    % Convert the image to a vector
    img_vector = double(img_gray(:));

    % Initialize the cluster centroids
    centroids = rand(K, size(img_vector, 2));

    % Initialize old_centroids
    old_centroids = zeros(size(centroids));

    % Set the maximum number of iterations and convergence threshold
    max_iter = 100;

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

    % Reshape the cluster labels into an image
    segmented_img = reshape(cluster_labels, size(img_gray));
end
