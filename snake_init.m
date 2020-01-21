function circle = snake_init( x0, y0, r, n_points)
% Creates points along circle with 
% center in (x0,y0), radius r and number of points n_points

circle = zeros(n_points, 2);
for i=1:n_points
   circle(i, 1) = round(x0+r*cos((i*2*pi)/n_points));
   circle(i, 2) = round(y0+r*sin((i*2*pi)/n_points));
end

end

