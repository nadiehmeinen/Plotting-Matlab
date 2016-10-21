% Resize legend sample lines
%
%SYNOPSIS
% RESIZE_LEGEND_LINE(scale)
%
%
% Based on:
% http://stackoverflow.com/questions/4151221/change-the-size-of-a-fill-sample-in-matlab-legend

function resize_legend_line(scale)

hLegend = findobj('Type','legend');
nn      = length(hLegend);

for ii = 1:nn
    entries = hLegend(ii).EntryContainer.Children;
    mm      = length(entries);
    for jj = 1:mm
        entries(jj).Icon.Transform.Matrix(1) = entries(jj).Icon.Transform.Matrix(1)*scale;
    end
    
end

end