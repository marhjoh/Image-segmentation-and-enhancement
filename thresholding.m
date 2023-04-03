% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Convert the images to grayscale
img_flower_gray = rgb2gray(img_flower);
img_tiger_gray = rgb2gray(img_tiger);

% Perform thresholding
threshold = 128; % Set the threshold value
binary_img_flower = img_flower_gray > threshold;
binary_img_tiger = img_tiger_gray > threshold;

% Display the original image and the segmented images
figure;
subplot(2,2,1); imshow(img_flower_gray); title('Original Image');
subplot(2,2,2); imshow(img_tiger_gray); title('Original Image');
subplot(2,2,3); imshow(binary_img_flower); title('Thresholding');
subplot(2,2,4); imshow(binary_img_tiger); title('Thresholding');