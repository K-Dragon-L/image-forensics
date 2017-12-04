function [OutputMap, a, b] = NOI1analyze( imPath )
    BlockSize=8;
    
    im=CleanUpImage(imPath);
    
    OutputMap = GetNoiseMap(im, BlockSize);
    a = 0;
    b = 0;
end