%% Region-Growing Segmentation
% The threshold in the region growing segmentation algorithm determines the maximum allowed difference in pixel intensity 
% between neighboring pixels in the same segment. Low threshold result in neighboring pixels that are very different in
% intensity are allowed to belong to the same segment making the execution time high. High threshold result in only neighboring 
% pixels that are very similar in intensity are allowed to belong to the same segment. Choosing an appropriate threshold is critical 
% for the success of the region growing segmentation algorithm. 

function seg = my_region_growing(img, threshold)
    % Convert the input image to grayscale and double
    img = double(rgb2gray(img));

    % Initialize the segmentation matrix
    seg = zeros(size(img));

    % Define the 4-connected neighborhood
    neighbor = [-1 0; 1 0; 0 -1; 0 1];

    % Loop over each pixel in the image
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            % If the current pixel has not been assigned to a segment
            if seg(i, j) == 0
                % Create a new segment and add the current pixel to it
                seg_id = max(seg(:)) + 1;
                seg(i, j) = seg_id;

                % Initialize the region growing queue with the current pixel
                queue = [i, j];

                % Grow the segment by adding neighboring pixels that are within the threshold
                while ~isempty(queue)
                    % Get the next pixel from the queue
                    curr_pix = queue(1, :);
                    queue(1, :) = [];

                    % Check the 4-connected neighbors of the current pixel
                    for k = 1:size(neighbor, 1)
                        neighbor_pix = curr_pix + neighbor(k, :);

                        % If the neighbor pixel is within the image bounds
                        if all(neighbor_pix > 0) && neighbor_pix(1) <= size(img, 1) && neighbor_pix(2) <= size(img, 2)
                            % If the neighbor pixel has not been assigned to a segment
                            if seg(neighbor_pix(1), neighbor_pix(2)) == 0
                                % If the neighbor pixel intensity is within the threshold
                                if abs(img(curr_pix(1), curr_pix(2)) - img(neighbor_pix(1), neighbor_pix(2))) <= threshold
                                    % Add the neighbor pixel to the segment and the queue
                                    seg(neighbor_pix(1), neighbor_pix(2)) = seg_id;
                                    queue(end+1, :) = neighbor_pix;
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
