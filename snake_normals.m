function [ normals ] = snake_normals( points )
% Computes normals for every point
% as unit vector orthogonal to c(i+1)-c(i-1)
    
    points_shifted = [points(end-1, :); points(end, :); points(1:end-2, :)];
    diff = points - points_shifted;
    diff = [ diff(2:end, :); diff(1, :)];
    normals = [diff(:, 2) -diff(:, 1)];
    normals(:,1) = normals(:,1)./sqrt(normals(:,1).^2 + normals(:,2).^2);
    normals(:,2) = normals(:,2)./sqrt(normals(:,1).^2 + normals(:,2).^2);
    
    if sum(~isfinite(normals))
       normals(~isfinite(normals)) = 0; 
    end
        
    
end

