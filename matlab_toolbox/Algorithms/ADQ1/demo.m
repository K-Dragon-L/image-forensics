% Copyright (C) 2016 Markos Zampoglou
% Information Technologies Institute, Centre for Research and Technology Hellas
% 6th Km Harilaou-Thermis, Thessaloniki 57001, Greece

close all; clear all;
im1='/Users/christianlee/Downloads/ForensicsProjectImages-20171129/monk_base.jpg';
im2='/Users/christianlee/Downloads/ForensicsProjectImages-20171129/monk_manip.jpg';
subplot(2,2,1);
imshow(CleanUpImage(im1));
subplot(2,2,2);
imshow(CleanUpImage(im2));
subplot(2,2,3);
[OutputMap, ~, ~] = analyze(im1);
imagesc(OutputMap);
subplot(2,2,4);

[OutputMap2, ~, ~] = analyze(im2);

imagesc(OutputMap2);

OutputMap = OutputMap/max(OutputMap(:));
OutputMap2 = OutputMap2/max(OutputMap2(:));

OutputMap = imgaussfilt(OutputMap, 2);
OutputMap2 = imgaussfilt(OutputMap2, 2);

Edge1 = edge(OutputMap);
Edge2 = edge(OutputMap2);
figure;
subplot(2,1,1);
imshow(Edge1);
subplot(2,1,2);
imshow(Edge2);

OutputMap2 = imgaussfilt(OutputMap2, 3);
figure;
imagesc(OutputMap2);

image = rgb2gray(imread('/Users/christianlee/Downloads/ForensicsProjectImages-20171129/monk_base.jpg'));
[x, y] = size(image);
OutputMap = imresize(OutputMap, [x, y]);

figure;
imagesc(OutputMap);
m = max(OutputMap(:));
for i=1:x
    for j=1:y
        if OutputMap(i, j) < m*0.5
            image(i, j) = 0;
            
        end
    end
end

figure;
imshow(image);
