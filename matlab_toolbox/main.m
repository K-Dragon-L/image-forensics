clear all; close all;

addpath(genpath('/Users/austinmcever/School/Fall 17/ECE278/proj2/image-forensics/matlab_toolbox'));
path_to_img = '/Users/christianlee/Downloads/ForensicsProjectImages-20171129/monk_base.jpg';
nfuncs = 10;

funcs_cell = cell(nfuncs, 1);
funcs_cell{1}  =  @ADQ1analyze;
%funcs_cell{2}  =  @ADQ2analyze;
%funcs_cell{2}  = @ADQ3analyze;
funcs_cell{2}  = @BLKanalyze;
funcs_cell{3}  = @CAGIanalyze;
funcs_cell{4}  = @CFA1analyze;
funcs_cell{5}  = @CFA2analyze;
%funcs_cell{6}  = @CFA3analyze;
funcs_cell{6}  = @DCTanalyze;
funcs_cell{7} = @ELAanalyze;
%funcs_cell{8} = @GHOanalyze;
%funcs_cell{8} = @NADQanalyze;
funcs_cell{8} = @NOI1analyze;
funcs_cell{9} = @NOI2analyze;
funcs_cell{10} = @NOI4analyze;

maps = cell(nfuncs, 1);
binary_maps = cell(nfuncs, 1);
connectivity = cell(nfuncs, 1);
numPixels = cell(nfuncs, 1);
score = cell(nfuncs, 1);

for i = 1:length(funcs_cell)
    disp(i)
    maps{i} = test_method(path_to_img, false, funcs_cell{i});
    [m, n] = size(maps{i});
    binary_maps{i} = zeros(m, n);
    for x=1:m
        for y=1:n
            if maps{i}(x, y) ~= 0
                binary_maps{i}(x, y) = 1;
            end
        end
    end
    connectivity{i} = bwconncomp(binary_maps{i}, 8);
    numPixels{i} = cellfun(@numel,connectivity{i}.PixelIdxList);
    if numPixels{i} > 0.8 * m * n
        score{i} = 0;
    elseif connectivity{i}.NumObjects >= 10
        score{i} = 0;
    elseif numPixels{i} < 0.1 * m * n
        score{i} = 0;
    end
end
