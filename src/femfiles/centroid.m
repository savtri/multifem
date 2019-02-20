function center=centroid(varargin)

%% extract input arguments

% use empty mass by default
mass = [];

if nargin==1
    % give only array of points
    pts = varargin{1};
    
elseif nargin==2
    % either POINTS+MASS or PX+PY
    var = varargin{1};
    if size(var, 2)>1
        % arguments are POINTS, and MASS
        pts = var;
        mass = varargin{2};
    else
        % arguments are PX and PY
        pts = [var varargin{2}];
    end
    
elseif nargin==3
    % arguments are PX, PY, and MASS
    pts = [varargin{1} varargin{2}];
    mass = varargin{3};
end

%% compute centroid

if isempty(mass)
    % no weight
    center = mean(pts);
    
else
    % format mass to have sum equal to 1, and column format
    mass = mass(:)/sum(mass(:));
    
    % compute weighted centroid
    center = sum(bsxfun(@times, pts, mass), 1);
    % equivalent to:
    % center = sum(pts .* mass(:, ones(1, size(pts, 2))));
end



end