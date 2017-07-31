% Make ugly Matlab figures prettier (barebone)
%
%
%SYNOPSYS
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
% * save option?


function prettify(fig_handler, style)

%..........................................................................
% INITIALIZE
%..........................................................................

fig     = fig_handler;
ax      = fig.CurrentAxes;
leg     = findobj(fig,'Tag','legend');

htxt    = findall(fig,'Type','text'); % all text handles; text(), title(), xlabel(), ylabel()
ntxt    = length(htxt);

if nargin < 1
    % prettify all figures
elseif nargin < 2
    style = 'latex';
end

%..........................................................................
% FORMAT FIGURE(S)
%..........................................................................

switch lower(style)
    case {'latex', 'l'}
        
        interpreter = 'LaTeX';
        
        % text(), title(), xlabel(), ylabel()
        for ii = 1:ntxt
            tmp = htxt(ii);
            tmp.Interpreter = interpreter;
        end
        
        % ticklabels
        ax.TickLabelInterpreter = interpreter;
        
        % legend
        if ~isempty(leg)
            n = numel(leg);
            for ii = 1:n
                leg(ii).Interpreter         = interpreter;
            end
        end
               
    otherwise
        error(['Unknown style: ', style])
end

set(gcf,'color','w')

end

