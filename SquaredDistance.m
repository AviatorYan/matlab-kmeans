function squaredDistance = SquaredDistance(firstPoint, secondPoint)
    % 'SquaredDistance': A function that returns the distance squared between two
    % points in 3D space. Can be used within the AssignToClusters function in
    % order to find nearest cluster.
    % Inputs: firstPoint, secondPoint as 1x1x3, 3x1, 1x3 matrices.
    % Output: squaredDistance.
    
    % Author: Jack Yarndley

    % Return the sum of the difference squared between the two different input
    % matrices, giving the squared distance. The : operator is used to
    % return the values of the indices of each input array allowing for all
    % required shapes and sizes to be input.
    squaredDistance = sum((firstPoint(:) - secondPoint(:)).^2);
end