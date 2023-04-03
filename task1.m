% Read in the images
img_flower = imread("images/flower.jpg");
img_tiger = imread("images/tiger.jpg");

% Convert the images to grayscale
img_flower_gray = rgb2gray(img_flower);
img_tiger_gray = rgb2gray(img_tiger);
