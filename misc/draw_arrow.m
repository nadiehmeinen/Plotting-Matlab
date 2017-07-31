%
%
%TODO
% vectorize
% head should inherit the properties of the body

function draw_arrow(x,y,varargin)

x_minmax    = xlim;
y_minmax    = ylim;

% scale due to uneven axis limits
yscale      = diff(y_minmax)/diff(x_minmax);

% Scale matrix
lambda      = 1;
S           = lambda*eye(2,2);
S(2,2)      = S(2,2)*yscale;

% body of the arrow
b_angle     = -atan(diff(y)/diff(x));
% b_angle = 0;
pb          = plot(x,y,varargin{:});

% head of the arrow
% ran     = max(range(ylim), range(xlim));
scale       = 0.03*diff(x_minmax);
s           = sign(-diff(x));
h_angle     = 30*pi/180;

% rotation matrix
R           = [cos(b_angle), -sin(b_angle); sin(b_angle), cos(b_angle)];
% translation vector
T           = repmat([x(2), y(2)],3,1);
xh          = [s*scale, 0, s*scale]*cos(h_angle);
yh          = [s*scale, 0, -s*scale]*sin(h_angle);
xyh         = [xh.', yh.']*R*S + T;
plot(xyh(:,1), xyh(:,2), varargin{:})

% restore the original axis limits
xlim(x_minmax)
ylim(y_minmax)

end