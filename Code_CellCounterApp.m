%Matlab Code used to generate the results
function cellCounterApp 
 % Create the UI figure
 fig = uifigure('Name', 'Cell Counter', 'Position', [100, 100, 600, 450]); 
 % Create axes for displaying images
 ax = uiaxes('Parent', fig, 'Position', [40, 130, 560, 280]); 
 % Path to the initialization image
 initImagePath = 'ini.png'; 
 % Check if the image file exists
 if exist(initImagePath, 'file') 
 initializationImage = imread(initImagePath); 
 imshow(initializationImage, 'Parent', ax); 
 else
 uialert(fig, 'Initialization image not found', 'File Error'); 
 end
 % Label for size threshold input
 uilabel(fig, 'Text', 'Size Threshold:', 'Position', [480, 90, 100, 20]); 
 % Numeric edit field for size threshold
 sizeThresholdField = uieditfield(fig, 'numeric', 'Position', [480, 50, 100, 30]); 
 sizeThresholdField.Value = 20; % Default value
 % Button to load an image
 uibutton(fig, 'push', 'Text', 'Load Image', 'Position', [20, 50, 100, 30], 
'ButtonPushedFcn', @(btn,event) loadImage(ax)); 
 % Button to enhance the image
 uibutton(fig, 'push', 'Text', 'Enhance Image', 'Position', [140, 50, 100, 30], 
'ButtonPushedFcn', @(btn,event) enhanceImage(ax)); 
 % Button to segment the image
 uibutton(fig, 'push', 'Text', 'Segment Image', 'Position', [260, 50, 100, 30], 
'ButtonPushedFcn', @(btn,event) segmentImage(ax, sizeThresholdField)); 
 % Button to count the cells
 uibutton(fig, 'push', 'Text', 'Count Cells', 'Position', [380, 50, 100, 30], 
'ButtonPushedFcn', @(btn,event) countCells(ax)); 
 % Store image data
 fig.UserData.image = []; 
 fig.UserData.grayImage = []; 
 fig.UserData.filteredImage = []; 
 fig.UserData.enhancedImage = []; 
 fig.UserData.labeledImage = []; 
end
% Callback functions for the UI buttons
function loadImage(ax) 
 [file, path] = uigetfile({'*.png;*.jpg;*.tif', 'All Image Files'}); 
 if isequal(file, 0) 
 disp('User selected Cancel'); 
 else
 ax.Parent.UserData.image = imread(fullfile(path, file)); 
 imshow(ax.Parent.UserData.image, 'Parent', ax); 
 title(ax, 'Image Loaded Successfully!'); 
 end
end
function enhanceImage(ax) 
 if isempty(ax.Parent.UserData.image) 
 uialert(ax.Parent, 'No image loaded', 'Error'); 
 return; 
 end
 ax.Parent.UserData.grayImage = rgb2gray(ax.Parent.UserData.image); 
 ax.Parent.UserData.filteredImage = medfilt2(ax.Parent.UserData.grayImage); 
 ax.Parent.UserData.enhancedImage = imadjust(ax.Parent.UserData.filteredImage); 
 imshow(ax.Parent.UserData.enhancedImage, 'Parent', ax); 
 title(ax, 'Image Enhanced'); 
end
function segmentImage(ax, sizeThresholdField) 
 if isempty(ax.Parent.UserData.enhancedImage) 
 uialert(ax.Parent, 'Enhance the image first', 'Error'); 
 return; 
 end
 % Convert to binary image
 binaryImage = imbinarize(ax.Parent.UserData.enhancedImage); 
 
 %Morphological Operations to clean the image
 binaryImage = imopen(binaryImage, strel('disk', 2)); 
 
 % Compute the distance transform & Apply watershed
 distanceTransform = bwdist(~binaryImage); 
 modDistance = -distanceTransform; 
 modDistance(~binaryImage) = Inf; 
 waterShedLabels = watershed(modDistance); 
 labeledImage = binaryImage; 
 labeledImage(waterShedLabels == 0) = 0; 
 sizeThreshold = sizeThresholdField.Value; 
 labeledImage = bwareaopen(labeledImage, sizeThreshold); 
 ax.Parent.UserData.labeledImage = labeledImage; 
 imshow(labeledImage, 'Parent', ax); 
 title(ax, 'Image Segmented'); 
end
function countCells(ax) 
 if isempty(ax.Parent.UserData.labeledImage) 
 uialert(ax.Parent, 'Segment the image first', 'Error'); 
 return; 
 end
 cc = bwconncomp(ax.Parent.UserData.labeledImage); 
 numberOfCells = cc.NumObjects; 
 perim = bwperim(ax.Parent.UserData.labeledImage); 
 outlinedImage = ax.Parent.UserData.image; 
 outlinedImage(repmat(perim, [1, 1, 3])) = 255; 
 imshow(outlinedImage, 'Parent', ax); 
 title(ax, ['Number of Cells: ', num2str(numberOfCells)]); 
end
%================================================================%
% Other Code for counting cells in the ground truth images:
% Path to the folder
folderPath =  'C:\Final_Project\Files\truths\'; 
% Get a list of all files in the folder
filePattern = fullfile(folderPath, '*.png'); % Change to whatever pattern matches 
your images
imageFiles = dir(filePattern); 
% Loop over all files
for k = 1:length(imageFiles) 
 % Full path to the image
 imagePath = fullfile(folderPath, imageFiles(k).name); 
 
 % Read the image
 img = imread(imagePath); 
 
 % Separate the red channel
 redChannel = img(:,:,1); 
 
 % Threshold the red channel to get a binary image
 redThreshold = 50; % Adjust based on your image's characteristics
 binaryImage = redChannel > redThreshold; 
 
 % Remove small objects (noise) from the binary image
 minDotSize = 1; % Adjust this value as needed
 binaryImage = bwareaopen(binaryImage, minDotSize); 
 
 % Label connected components to count the dots
 [~, numDots] = bwlabel(binaryImage); 
 
 % Output the number of red dots for the current image
 disp(['Number of Red Dots in ', imageFiles(k).name, ': ', num2str(numDots)]); 
end