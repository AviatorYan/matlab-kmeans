function randomPoints = SelectKRandomPoints(imageData, K)
    % 'SelectKRandomPoints': A function which given an image matrix and
    % number of clusters will generate a random starting point for each
    % cluster within the image data without replacement.
    % Inputs: imageData (NxMx3 image data), K (integer number of clusters)
    % Output: randomPoints (Kx2 matrix of row and column indices to random
    % points)
    
    % Author: Jack Yarndley

    % Get total number of pixels in image so that the randperm function can be used
    totalPixels = size(imageData, 1) * size(imageData, 2);
    % Use randperm function to get K unique random pixels from number of
    % total pixels.
    randPixels = randperm(totalPixels, K);
    
    % Create Kx2 matrix of row and column indices by using ind2sub on the
    % width and height of image matrix, and the random pixels temporary
    % array.
    [randomPoints(:, 1), randomPoints(:, 2)] = ind2sub([size(imageData, 1) size(imageData, 2)], randPixels);
end