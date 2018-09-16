function newImage = CreateKColourImage(clusteredImage, pointColours)
    % 'CreateKColourImage': A function which given a NxM matrix of colour
    % indexes and a RGB index list matrix will recreate the NxMx3 array in
    % order to be displayed and saved as an image.
    % Inputs: clusteredImage (NxM matrix of indices), pointColours (Kx3
    % matrix of RGB colours points for each cluster)
    % Output: newImage (NxMx3 matrix in image format)
    
    % Author: Jack Yarndley

    % Select appropiate RGB triplet for each index in clusteredImage from 
    % the pointColours matrix and convert to uint8.
    newImage(:, 1, 1:3) = uint8(pointColours(clusteredImage(:), 1, 1:3));
    
    % Reshape the newImage matrix into a NxMx3 image matrix of the correct
    % size to be displayed.
    newImage = reshape(newImage, [size(clusteredImage) 3]);
end