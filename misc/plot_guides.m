% Plot guidelines in the position of tickmarks
%
%SYNOPSYS
% PLOT_GUIDES(ga_handler, Line)
%
%INPUT
% ga_handler    handler of the axes belonging to the figure to be modified
%OPTIONAL
% Line.         structure variable specifying the properties of the guides
%  .color       color of the guide lines, default = [0.7, 0.7, 0.7]
%  .style       default = '-'
%  .width       default = 0.7
%  .layer       default = 'bottom'
%
%See also
% grid

function plot_guides(ga_handler, Line)

if nargin < 2
    Line = [];
end

if ~isfield(Line, 'color')
    Line.color = [0.7, 0.7, 0.7];
end

if ~isfield(Line, 'style')
    Line.style = '-';
end

if ~isfield(Line, 'width')
    Line.width = 0.7;
end

if ~isfield(Line, 'layer')
    Line.layer = 'bottom';
end

% get axis limits
xminmax = xlim;
xmin = xminmax(1); xmax = xminmax(2);
yminmax = ylim;
ymin = yminmax(1); ymax = yminmax(2);

% get original axis tickmarks
xo = get(ga_handler, 'XTick');
yo = get(ga_handler, 'YTick');

% pot vertical guides
x = [xo; xo];
y = repmat([ymin; ymax], 1, size(x,2));
h = plot(x, y, 'Color', Line.color, 'LineWidth', Line.width, 'LineStyle', Line.style);
uistack(h, Line.layer)

% plot horizontal guides
y = [yo; yo];
x = repmat([xmin; xmax], 1, size(y,2));
h = plot(x, y, 'Color', Line.color, 'LineWidth', Line.width, 'LineStyle', Line.style);
uistack(h, Line.layer)

% bring axes' ticks to top
set(ga_handler, 'Layer','top')

% force the original axis limits
axis([xmin, xmax, ymin, ymax])

end