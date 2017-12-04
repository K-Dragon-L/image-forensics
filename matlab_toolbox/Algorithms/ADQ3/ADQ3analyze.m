function [OutputMap, a, b] = ADQ3analyze( imPath )
    % Copyright (C) 2016 Markos Zampoglou
    % Information Technologies Institute, Centre for Research and Technology Hellas
    % 6th Km Harilaou-Thermis, Thessaloniki 57001, Greece

    im=jpeg_read(imPath);
    OutputMap = BenfordDQ(im);
    a = 0;
    b = 0;
end