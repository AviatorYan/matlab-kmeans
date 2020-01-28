# matlab-kmeans
A fast, vectorised implementation of the K-Means clustering algorithm intended for use with image clustering. 

## Usage
The vectorised implementation of the algorithm is contained within ```KMeansRGB.m```. This algorithm needs to be supplied with starting points which are generally randomly sampled from within the image colour sample space. An implementation of this is within ```SelectKRandomPoints.m```. To generate an image from the clustered points, pass the output to ```CreateKColourImage.m```. 
