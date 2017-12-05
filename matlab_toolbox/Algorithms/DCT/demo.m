

close all; clear all;
im1='demo.jpg'
[OutputMap] = DCTanalyze(im1);
imagesc(OutputMap);
title('JPG');
figure;
im2='demo.png'
[OutputMap] = DCTanalyze(im2);
imagesc(OutputMap);
title('PNG');