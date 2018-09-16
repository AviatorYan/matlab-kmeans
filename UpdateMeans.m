function meanColours = UpdateMeans(imageData, K, clusteredImage)
    % 'UpdateMeans': A function which given the image matrice, number of
    % clusters and the temporary clustered image will return the new mean
    % colour (location) values of each cluster.
    % Inputs: imageData (MxNx3 image data), K (integer number of clusters), clusteredImage
    % (MxN integer matrice of assigned clusters)
    % Output: meanColours (Kx1x3 matrice of new mean colours)
    
    % Author: Jack Yarndley

    % Initialize meanColours array with zeros.
    meanColours = zeros(K, 1, 3);
    % Reshape imageData array into a Nx3 array of each RGB triplet.
    imageColours = reshape(imageData(:), [], 3);
    
    % Go over each cluster index
    for i = 1:K
        % Select all RGB triplets from imageColours array that are assigned
        % to the cluster i in the clusteredImage matrice. Take mean of all
        % these to get RGB triplet of new mean colours, which is the new
        % mean.
        meanColours(i, 1, 1:3) = mean(imageColours(clusteredImage == i, 1:3), 1);
    end
end