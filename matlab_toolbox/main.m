clear all; close all;

addpath(genpath('/Users/austinmcever/School/Fall 17/ECE278/proj2/image-forensics/matlab_toolbox'));
path_to_img = '/Users/austinmcever/School/Fall 17/ECE278/proj2/ForensicsProjectImages/base/arnold_base.jpg';

nfuncs = 10;

funcs_cell = cell(nfuncs);
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

maps = cell(nfuncs);

for i = 1:length(funcs_cell)
    disp(i)
    maps{i} = test_method(path_to_img, false, funcs_cell{i});
end