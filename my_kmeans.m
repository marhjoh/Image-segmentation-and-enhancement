%% K-means clustering Segmentation
% The k-means algorithm is used to segment an image into K regions or
% clusters, much alike thresholding but with the oppurtunity to allow more
% than two "classes".

function [seg, centers] = my_kmeans(img, K)
    
    % Convert the input image to grayscale and double
    img_gray = double(rgb2gray(img));

    % Initialize the segmentation matrix
    seg = zeros(size(img_gray));

    % Define the step size for thresholding
    step = 256/K;

    % Initialize the centers array
    centers = zeros(1,K);

    % Compute the initial centers
    for i = 1:K
        centers(i) = (i-1/2)*step;
    end

    % Loop over each pixel in the image
    for i = 1:size(img_gray, 1)
        for j = 1:size(img_gray, 2)
            % Compute the index of the closest center
            [~, index] = min(abs(img_gray(i,j) - centers));
            % Assign the pixel to the corresponding segment
            seg(i,j) = index;
        end
    end
end
