function f = test_method(im, verbose, analyze)
addpath(genpath('/Users/austinmcever/School/Fall 17/ECE278/proj2/image-forensics/matlab_toolbox'));
[OutputMap, ~, ~] = analyze(im);
if verbose
    subplot(2,1,1);
    imshow(CleanUpImage(im));
    subplot(2,1,2);
    imagesc(OutputMap);
end
    
OutputMap = OutputMap/max(OutputMap(:));

OutputMap = imgaussfilt(OutputMap, 2);

Edge = edge(OutputMap);
if verbose == true   
    figure;
    imshow(Edge);
end

OutputMap = imgaussfilt(OutputMap, 3);

image = rgb2gray(imread(im));
[x, y] = size(image);
OutputMap = imresize(OutputMap, [x, y]);

if verbose
    figure;
    imagesc(OutputMap);
end

m = max(OutputMap(:));
for i=1:x
    for j=1:y
        if OutputMap(i, j) < m*0.5
            image(i, j) = 0;
            
        end
    end
end

if verbose
    figure;
    imshow(image);
    disp('Press a key to continue.');
    pause;
end

f = image; % should return gaussian output, mask, probability of fake (0 def real, 1, def fake)
end 
