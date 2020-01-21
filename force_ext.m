function snake_out = force_ext( snake, frame, disp_step, neighbours )
% Calculates snake new point locations 
%   after applying external forces
    
    % Calculate average inside and outside intensities
    
    normals = snake_normals(snake);
    [m_in, m_out] = deformable_mean_in_out(frame, snake, normals, neighbours);
    m_avg = (m_in + m_out)/2;
    
    % Get snake's values in desired points
    snake_values = frame(sub2ind(size(frame), snake(:,2), snake(:,1)));
    % Calculate snake displacement with displacement step
    snake_displacement = disp_step*(m_avg - snake_values);
    % Calculate snake points in next step
    snake_out = snake+normals.*snake_displacement;
    
end

