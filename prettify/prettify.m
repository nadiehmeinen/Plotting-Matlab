% Make ugly Matlab figures prettier (barebone)
%
%
%SYNOSYS
% PRETTIFY(fig_handler, style)
%
%
%INPUT
% fig_handler   handle of the figure to be modified
%
%OPTIONAL
% style         style identifier /string, default = 'latex'/      
%
%OUTPUT
% pretty/publication quality figure(s)
%
%

% NOTES
%
% 
% EXTENSION/TODO
% * handle multiple plots in the same figure, e.g. subplot
% * 3D plots
% * additional styles
% * prettify all figures (open windows)
% * save option


function prettify(fig_handler, style)

fig     = fig_handler;
ax      = fig.CurrentAxes;
leg     = findobj(fig,'Tag','legend');


if nargin < 1
    % prettify all figures
elseif nargin < 2
    style = 'latex';
end

switch lower(style)
    case {'latex', 'l'}
        
        interpreter = 'LaTeX';
        
        % axes & title
        ax.TickLabelInterpreter = interpreter;
        ax.XLabel.Interpreter   = interpreter;
        ax.YLabel.Interpreter   = interpreter;
        ax.Title.Interpreter    = interpreter;
        
        % legend
        if ~isempty(leg)
            leg.Interpreter         = interpreter;
        end
               
    otherwise
        error(['Unknown style: ', style])
end


end

