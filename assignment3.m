% Step 1: Read the color image of your face and convert it to grayscale
colorImage = imread('Aneerban.jpg');
grayImage = rgb2gray(colorImage);

% Step 2: Find and plot bit plane images
figure('Name', 'Bit Planes');
subplot(3, 3, 1);
imshow(grayImage);
title('Original Grayscale Image');

bitPlanes = cell(8, 1);  % Create a cell array to store bit planes

for i = 1:8
    bitPlanes{i} = bitget(grayImage, i);  % Extract the i-th bit plane
    subplot(3, 3, i + 1);                % Create subplots for bit planes
    imshow(logical(bitPlanes{i}));       % Display the bit plane as a binary image
    title(['Bit Plane ', num2str(i - 1)]);
end

% Step 3: Find run-length code for each bit plane and calculate compression size
originalSize = numel(grayImage);
compressedSizes = zeros(8, 1);
runLengthCodes = cell(8, 1);

for i = 1:8
    runLengthCode = rle(bitPlanes{i}(:));  % Calculate run-length code
    runLengthCodes{i} = runLengthCode;
    compressedSize = numel(runLengthCode);
    compressedSizes(i) = compressedSize;

    fprintf('Bit Plane %d Run-Length Code:\n', i - 1);
    disp(runLengthCode);
end

% Step 4: Calculate the efficiency of the method
efficiency = originalSize ./ compressedSizes;

% Display the original size, compressed sizes, and efficiencies
fprintf('Original Image Size: %d bytes\n', originalSize);
for i = 1:8
    fprintf('Bit Plane %d: Compressed Size = %d bytes, Efficiency = %.2f\n', i - 1, compressedSizes(i), efficiency(i));
end

% Optional: You can save the run-length codes for further analysis
save('run_length_codes.mat', 'runLengthCodes');
