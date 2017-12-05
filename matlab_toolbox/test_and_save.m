function f = test_and_save(im, verbose, analyze, name)

addpath(genpath('/Users/austinmcever/School/Fall 17/ECE278/proj2/image-forensics/matlab_toolbox'));

[OutputMap, ~, ~] = analyze(im);
write_path = '/Users/austinmcever/School/Fall 17/ECE278/proj2/results/';
write_path = strcat(write_path, name);
if verbose  
    write_path2 = strcat(write_path, '-raw.jpeg');
    save_imagesc(OutputMap, write_path2, 'jpeg');
end

OutputMap = OutputMap/max(OutputMap(:));

OutputMap = imgaussfilt(OutputMap, 2);
OutputMap = imgaussfilt(OutputMap, 3);

image = rgb2gray(imread(im));
[x, y] = size(image);
OutputMap = imresize(OutputMap, [x, y]);

if verbose
    write_path2 = strcat(write_path, '-smooth.jpeg');
    save_imagesc(OutputMap, write_path2, 'jpeg');
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
    write_path2 = strcat(write_path, '-mask.jpeg');
    %save_imagesc(image, write_path2, 'jpeg');
    imwrite(image, write_path2);
    write_path2 = strcat(write_path, '-orig.jpeg');
    %save_imagesc(image, write_path2, 'jpeg');
    imwrite(imread(im), write_path2);
end

f = image; % should return gaussian output, mask, probability of fake (0 def real, 1, def fake)
end 
