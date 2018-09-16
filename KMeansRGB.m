function [clusteredImage, pointColours] = KMeansRGB(imageData, pointColours, iterations) 
    % 'KMeansRGB': A function that given a NxMx3 matrix of image data,
    % inital seed point colours and a maximum number of iterations, will
    % preform the K-means algorithm to cluster the image in a set number of
    % specific colours, returning a NxM matrix of the indices to the
    % colours, which are stored in a seprate output.
    % Inputs: imageData (NxMx3 image data), pointColours (Kx3 matrix of
    % point colours), iterations (integer number of iterations).
    % Outputs: clusteredImage (NxM uint8 map of indices to final
    % pointColours), pointColours(final point colours for image).
    
    % Author: Jack Yarndley
    
    % Convert image to (NxM)x3 matrix of colours, each column is one
    % colour. Set to double for calculations.
    imageColours = double(reshape(imageData(:), [], 3));
    
    % Create a copy of imageColours with type uint8 for fast retrieval of
    % data in the update means part of the algorithm.
    imageColours2 = uint8(imageColours);
    
    % Preallocate meanColours array with size Kx1x3.
    meanColours = zeros(size(pointColours, 1), 1, 3);
    
    % Vectorise each colour into a seperate column vector so that the
    % squaredDistances section can run instantly and preform the implicit
    % expansion quickly.
    imageRed = reshape(imageColours(:, 1), [], 1);
    imageGreen = reshape(imageColours(:, 2), [], 1);
    imageBlue = reshape(imageColours(:, 3), [], 1);

    % Begin iterating algorithm
    for i = 1:iterations
        % Vectorise the pointColours (which is the current meanColours)
        % into row vectors, which allows for the implicit expansion in the
        % squaredDistances section to work.
        meanRed = pointColours(:, 1)';
        meanGreen = pointColours(:, 2)';
        meanBlue = pointColours(:, 3)';
        
        % Calculate the distances squared to each point through implicit
        % expansion of the column and row vectors.
        squaredDistances = ((imageRed - meanRed).^2 + (imageGreen - meanGreen).^2 + (imageBlue - meanBlue).^2);
        
        % Only get indices from minimum of each row of squaredDistance
        % matrix to find assigned cluster
        [~, indices] = min(squaredDistances, [], 2);
        
        % Go over each cluster to find new mean colour of assigned points
        for j = 1:size(pointColours, 1)
            % Create logical column vector of when indices are at value
            % 'j', and cast to uint8 to be used to multiply with another
            % uint8 matrix.
            tempIndices = uint8(indices == j);
            
            % Calculate new mean colours by multiplying logical vector by
            % the imageColours matrix. Only the elements represented by a
            % logical '1' will remain. Get sum of these elements and divide
            % by the sum of the logical array (the number of elements
            % selected) to get the mean colours.
            meanColours(j, 1, 1:3) = sum(imageColours2 .* tempIndices, 1) ./ sum(tempIndices, 1);
        end
        
        % Check for convergance. Round function is not used here as
        % convergance is checked to the limit of MATLAB's precision so that
        % no pixel colours can be incorrectly identified.
        if meanColours == pointColours
            % The output clustered image is the indices matrix reshaped into 
            % the correct image size and converted to uint8 type.
            clusteredImage = uint8(reshape(indices, size(imageData, 1), size(imageData, 2)));
            
            % Exit for loop as algorithm has converged.
            return;
        else
            % Set the old pointColours to the new mean colours.
            pointColours = meanColours;
        end
        
        if i == iterations
            % Display warning message stating that the alogrithm did not
            % converge in the required number of iterations.
            warning('Maximum number of iterations was reached before convergence was achieved.');
            
            % The output clustered image is the indices matrix reshaped into 
            % the correct image size and converted to uint8 type.
            clusteredImage = uint8(reshape(indices, size(imageData, 1), size(imageData, 2)));
        end
    end
end
    