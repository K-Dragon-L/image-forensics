% The demo image is taken from the dataset used in:
% Fontani, Marco, Tiziano Bianchi, Alessia De Rosa, Alessandro Piva, and
% Mauro Barni. "A framework for decision fusion in image forensics based on
% Dempster–Shafer theory of evidence." Information Forensics and Security,
% IEEE Transactions on 8, no. 4 (2013): 593-607.
% Original image name: Forgery_final 15.jpg
% Dataset available at: http://clem.dii.unisi.it/~vipp/index.php/imagerepos
% itory/129-a-framework-for-decision-fusion-in-image-forensics-based-on-dem
% pster-shafer-theory-of-evidence

% Copyright (C) 2016 Markos Zampoglou
% Information Technologies Institute, Centre for Research and Technology Hellas
% 6th Km Harilaou-Thermis, Thessaloniki 57001, Greece

close all; clear all;
im='demo.jpg';
OutputMap = BLKanalyze(im);

OutputMap = imgaussfilt(OutputMap, 3);
OutputMap = OutputMap / max(OutputMap(:));

[m, n] = size(OutputMap);
LabelMap = zeros(m, n);
Label = 0;

for i=1:m
    for j=1:n
        if i-1 > 0 && j-1 > 0 && j+1 <= n
            if OutputMap(i, j) > 0.4 && LabelMap(i-1, j-1) == 0 && LabelMap(i-1, j) == 0 && LabelMap(i, j-1) == 0 && LabelMap(i-1, j+1) == 0
                Label = Label + 1;
                LabelMap(i, j) = Label;
            elseif OutputMap(i, j) > 0.4 && (LabelMap(i-1, j-1) ~= 0 || LabelMap(i-1, j) ~= 0 || LabelMap(i, j-1) ~= 0 || LabelMap(i-1, j+1) ~= 0)
                L = [LabelMap(i-1, j-1), LabelMap(i-1, j), LabelMap(i, j-1), LabelMap(i-1, j+1)];
                LabelMap(i, j) = max(L);
            elseif OutputMap(i, j) > 0.4
                LabelMap(i, j) = Label;
            end
        end
    end
end

if Label < 10
    LabelArea = zeros(Label, 1);
    LabelTotal = zeros(Label, 1);

    for i=1:m
        for j=1:n
            if LabelMap(i, j) ~= 0
                LabelArea(LabelMap(i, j)) = LabelArea(LabelMap(i, j)) + 1;
                LabelTotal(LabelMap(i, j)) = LabelTotal(LabelMap(i, j)) + OutputMap(i, j);
            end
        end
    end
    
    score = 0;
    for i=1:Label
        if LabelArea(i) > (m*n)*0.05
            score = score + LabelArea(i);
        end
    end
else
    score = 0;
end

imagesc(OutputMap);