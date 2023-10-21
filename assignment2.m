% Load the RGB image
rgbImage = imread('Aneerban.jpg');

% Convert to grayscale 
grayImage = rgb2gray(rgbImage);
 
% Convert to double
grayImage = double(grayImage);

% Compute the 2D FFT 
fftImage = fft2(grayImage);

% Shift the FFT
fftImageShifted = fftshift(fftImage);

% Compute the magnitude spectrum
magnitudeSpectrum = abs(fftImageShifted);

% Define circle radii
radii = [10, 30, 60, 160, 400];

% Get the center point of the spectrum image 
[rows, cols] = size(magnitudeSpectrum); centerX = cols / 2;
centerY = rows / 2;

% Initialize an array to store the power within each circle
powerEncircled = zeros(size(radii));

% Calculate power encircled by each circle and remove coefficients outside 
reconstructedSpectrum = zeros(size(magnitudeSpectrum));

for i = 1:numel(radii) radius = radii(i);
% Create a binary mask for the circle 
[x, y] = meshgrid(1:cols, 1:rows); circleMask = ((x - centerX).^2 + (y -centerY).^2) <= radius^2;

% Calculate the power within the circle
 
powerEncircled(i) = sum(sum(magnitudeSpectrum .* circleMask));

% Apply the mask to keep coefficients inside the circle
reconstructedSpectrum = reconstructedSpectrum + fftImageShifted .* circleMask;
end

% Shift back the spectrum 
reconstructedSpectrumShifted = ifftshift(reconstructedSpectrum);

% Compute the inverse Fourier transform to reconstruct the image
reconstructedImage = ifft2(reconstructedSpectrumShifted);

% Convert back to uint8 for displaying 
reconstructedImage = uint8(real(reconstructedImage));

% Display the reconstructed image 
imshow(reconstructedImage); title('Reconstructed Image');

 


