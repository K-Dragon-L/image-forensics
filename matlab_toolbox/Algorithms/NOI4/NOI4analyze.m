function [OutputMap, a, b] = NOI4analyze( imPath )
    %ANALYZE Summary of this function goes here
    %   Detailed explanation goes here

    NSize=3;
    Multiplier=10;
    Flatten=true;

    im=CleanUpImage(imPath);
    OutputMap = MedFiltForensics(im, NSize, Multiplier, Flatten);
    a = 0;
    b = 0;
end