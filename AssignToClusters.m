function clusteredImage = AssignToClusters(imageData, pointColours)
    % 'AssignToClusters': A function that given an image matrix and a set
    % of points will find out which point each pixel is closest to,
    % assigning each pixel to a 'cluster'.
    % Inputs: imageData (NxMx3 image data), pointColours (Kx3 array of
    % RGB point colours)
    % Output: clusteredImage (NxM matrix of which cluster each pixel is 
    % assigned to)
    
    % Author: Jack Yarndley

    % Get total number of pixels in imageData
    imageSize = size(imageData, 1) * size(imageData, 2);
    
    % Create a new array of all of the colours in the image in a (N*M)x3
    % array
    imageColours = double(reshape(imageData(:), [], 3));
    
    % Initialize an empty matrix to fill with each squared distance. Matrix 
    % The array has K columns, derived from the size of the pointColours
    % array, which allows for the squaredDistance from each pixel to the
    % mean to be stored in the matrix.
    squaredDistances = zeros(imageSize, size(pointColours, 1));
    
    % Go through each RGB triplet in the pointColours matrix
    for k = 1:size(pointColours, 1)
        % Vector based implementation of the squaredDistances function. Get
        % the sum of the distance between the imageColours array and the
        % specific pointColour squared. Inserts into specific column in the
        % squaredDistances matrix.
        squaredDistances(:, k) = sum((imageColours - pointColours(k, 1:3)).^2, 2);
    end

    % Calculates minimum of each row in the squaredDistances matrix
    % (closest point) and get the indice of it. This is the index to the
    % closest mean point in the pointColours matrix.
    [~, indices] = min(squaredDistances, [], 2);

    % Reshapes the indices array into the shape of the
    % image. Returns a clustered image of type uint8 to save space 
    % (limited to 255 colours in total). 
    clusteredImage = uint8(reshape(indices, size(imageData, 1), size(imageData, 2)));
end