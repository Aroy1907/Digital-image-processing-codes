% Load the color image
colorImage = imread('anagh_colour.jpg');

% Convert to grayscale
grayscaleImage = rgb2gray(colorImage);

% Display the grayscale image (optional)
imshow(grayscaleImage);

% Save the grayscale image (optional)
imwrite(grayscaleImage, 'grayscale_image.jpg');

% Load the grayscale image 
grayscaleImage = imread('grayscale_image.jpg');

% Convert the image to uint8 if it's not already
if ~isa(grayscaleImage, 'uint8')
    grayscaleImage = uint8(grayscaleImage);
end

% Increase Brightness
increasedBrightnessImage = grayscaleImage + 50; % Adjust the value (e.g., +50) to increase brightness

% Decrease Brightness
decreasedBrightnessImage = grayscaleImage - 50; % Adjust the value (e.g., -50) to decrease brightness

% Convert to double for imadjust
grayscaleImageDouble = double(grayscaleImage);

% Increase Contrast
increasedContrastImage = imadjust(grayscaleImageDouble, [0.2, 0.8], [0, 1]); % Adjust the range to control contrast

% Decrease Contrast
decreasedContrastImage = imadjust(grayscaleImageDouble, [0.1, 0.9], [0, 1]); % Adjust the range to control contrast

% Display the original and edited images
subplot(2, 3, 1), imshow(grayscaleImage), title('Original Image')
subplot(2, 3, 2), imshow(increasedBrightnessImage), title('Increased Brightness')
subplot(2, 3, 3), imshow(decreasedBrightnessImage), title('Decreased Brightness')
subplot(2, 3, 4), imshow(increasedContrastImage), title('Increased Contrast')
subplot(2, 3, 5), imshow(decreasedContrastImage), title('Decreased Contrast')

% Save edited images (optional)
imwrite(increasedBrightnessImage, 'increased_brightness_image.jpg');
imwrite(decreasedBrightnessImage, 'decreased_brightness_image.jpg');
imwrite(increasedContrastImage, 'increased_contrast_image.jpg');
imwrite(decreasedContrastImage, 'decreased_contrast_image.jpg');


% Load the edited images from part 2 (assuming they are in uint8 format)
increasedBrightnessImage = imread('increased_brightness_image.jpg');
decreasedBrightnessImage = imread('decreased_brightness_image.jpg');
increasedContrastImage = imread('increased_contrast_image.jpg');
decreasedContrastImage = imread('decreased_contrast_image.jpg');

% Apply Histogram Equalization to each edited image
eqIncreasedBrightness = histeq(increasedBrightnessImage);
eqDecreasedBrightness = histeq(decreasedBrightnessImage);
eqIncreasedContrast = histeq(increasedContrastImage);
eqDecreasedContrast = histeq(decreasedContrastImage);

% Display the original and histogram-equalized images
subplot(2, 3, 1), imshow(increasedBrightnessImage), title('Increased Brightness')
subplot(2, 3, 2), imshow(decreasedBrightnessImage), title('Decreased Brightness')
subplot(2, 3, 3), imshow(increasedContrastImage), title('Increased Contrast')
subplot(2, 3, 4), imshow(eqIncreasedBrightness), title('Equalized Brightness')
subplot(2, 3, 5), imshow(eqDecreasedBrightness), title('Equalized Brightness')
subplot(2, 3, 6), imshow(eqIncreasedContrast), title('Equalized Contrast')

% Save histogram-equalized images (optional)
imwrite(eqIncreasedBrightness, 'eq_increased_brightness_image.jpg');
imwrite(eqDecreasedBrightness, 'eq_decreased_brightness_image.jpg');
imwrite(eqIncreasedContrast, 'eq_increased_contrast_image.jpg');
imwrite(eqDecreasedContrast, 'eq_decreased_contrast_image.jpg');




% Load the grayscale image (original image)
grayscaleImage = imread('grayscale_image.jpg');

% Load the edited images and histogram-equalized images
increasedBrightnessImage = imread('increased_brightness_image.jpg');
decreasedBrightnessImage = imread('decreased_brightness_image.jpg');
increasedContrastImage = imread('increased_contrast_image.jpg');
decreasedContrastImage = imread('decreased_contrast_image.jpg');
eqIncreasedBrightness = imread('eq_increased_brightness_image.jpg');
eqDecreasedBrightness = imread('eq_decreased_brightness_image.jpg');
eqIncreasedContrast = imread('eq_increased_contrast_image.jpg');

% Create a figure for histograms
figure;
subplot(3, 1, 1);
imhist(grayscaleImage);
title('Original Image Histogram');

subplot(3, 1, 2);
imhist(increasedBrightnessImage);
title('Increased Brightness Histogram');

subplot(3, 1, 3);
imhist(decreasedBrightnessImage);
title('Decreased Brightness Histogram');

% Create another figure for images
figure;

subplot(3, 3, 1);
imshow(grayscaleImage);
title('Original Image');

subplot(3, 3, 2);
imshow(increasedBrightnessImage);
title('Increased Brightness');

subplot(3, 3, 3);
imshow(decreasedBrightnessImage);
title('Decreased Brightness');

subplot(3, 3, 4);
imshow(increasedContrastImage);
title('Increased Contrast');

subplot(3, 3, 5);
imshow(decreasedContrastImage);
title('Decreased Contrast');

subplot(3, 3, 6);
imshow(eqIncreasedBrightness);
title('Equalized Brightness');

subplot(3, 3, 7);
imshow(eqDecreasedBrightness);
title('Equalized Brightness');

subplot(3, 3, 8);
imshow(eqIncreasedContrast);
title('Equalized Contrast');

% Adjust subplot spacing for better visualization
spacing = 0.03;
P1 = get(gcf, 'Position');
set(gcf, 'Position', [P1(1), P1(2), P1(3), P1(4) - spacing]);
set(gcf, 'PaperPosition', [P1(1), P1(2), P1(3), P1(4) - spacing]);

P2 = get(gcf, 'Position');
set(gcf, 'Position', [P2(1), P2(2), P2(3), P2(4) - spacing]);
set(gcf, 'PaperPosition', [P2(1), P2(2), P2(3), P2(4) - spacing]);

% Add titles to the figures
figure(1);
sgtitle('Image Histograms');
figure(2);
sgtitle('Edited Images');

% Save the figures (optional)
% saveas(figure(1), 'histograms.png');
% saveas(figure(2), 'edited_images.png');




% Load the grayscale image (original image)
grayscaleImage = imread('grayscale_image.jpg');

% Load the edited images and histogram-equalized images
increasedBrightnessImage = imread('increased_brightness_image.jpg');
decreasedBrightnessImage = imread('decreased_brightness_image.jpg');
increasedContrastImage = imread('increased_contrast_image.jpg');
decreasedContrastImage = imread('decreased_contrast_image.jpg');
eqIncreasedBrightness = imread('eq_increased_brightness_image.jpg');
eqDecreasedBrightness = imread('eq_decreased_brightness_image.jpg');
eqIncreasedContrast = imread('eq_increased_contrast_image.jpg');

% Select the best histogram (choose one of the histogram-equalized images)
bestHistogramImage = eqIncreasedBrightness;  % Change this to your best choice

% Apply histogram matching to other edited images
matchedIncreasedBrightness = histeq(increasedBrightnessImage, imhist(bestHistogramImage));
matchedDecreasedBrightness = histeq(decreasedBrightnessImage, imhist(bestHistogramImage));
matchedIncreasedContrast = histeq(increasedContrastImage, imhist(bestHistogramImage));
matchedDecreasedContrast = histeq(decreasedContrastImage, imhist(bestHistogramImage));

% Display the original image, best image, and histogram-equalized best image
figure;
subplot(2, 3, 1);
imshow(grayscaleImage);
title('Original Image');

subplot(2, 3, 2);
imshow(bestHistogramImage);
title('Best Image (Histogram-equalized)');

subplot(2, 3, 3);
imshow(histeq(bestHistogramImage));
title('Histogram-equalized Best Image');

% Display the matched images
subplot(2, 3, 4);
imshow(matchedIncreasedBrightness);
title('Matched Increased Brightness');

subplot(2, 3, 5);
imshow(matchedDecreasedBrightness);
title('Matched Decreased Brightness');

subplot(2, 3, 6);
imshow(matchedIncreasedContrast);
title('Matched Increased Contrast');

% Add titles to the figure
sgtitle('Histogram Matching');

% Save the figure (optional)
% saveas(gcf, 'histogram_matching_results.png');










