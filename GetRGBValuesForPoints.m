function pointColours = GetRGBValuesForPoints(imageData, randomPoints)
    % 'GetRGBValuesForPoints': A function that given a matrix of row and
    % column indices corresponding to an image matrix will retun a Ax1x3
    % matrix of the RGB values for each point the the matrix.
    % Inputs: imageData (NxMx3 image data), randomPoints (Kx2 array of row
    % and column indices)
    % Output: pointColours (Kx1x3 matrix of RGB points for each requested
    % set of row and column indices)
    
    % Author: Jack Yarndley
    
    % Get total number of pixels in imageData array.
    imageSize = size(imageData, 1) * size(imageData, 2);
    
    % Convert indices given in randomPoints array to indices in the
    % imageData array. This will only given the red colour indices.
    redIndices = sub2ind(size(imageData), randomPoints(:, 1), randomPoints(:, 2));
    
    % To get the green and blue indices, the red indices are incremented by
    % multiples of the image size, as each layer of the image is stored incrementally.
    rgbIndices = [(redIndices), (redIndices + imageSize), (redIndices + 2*imageSize)];
    
    % Get the colours of each point from the indices array, convert to
    % double for calculations and store in Ax1x3 matrix.
    pointColours(:, 1, 1:3) = double(imageData(rgbIndices));
end