function binary_img = my_thresholding(img, threshold)

% Convert the image to grayscale
img_gray = rgb2gray(img);

% Perform thresholding
binary_img = img_gray > threshold;
end
