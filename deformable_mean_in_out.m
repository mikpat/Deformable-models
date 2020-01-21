function [m_in, m_out] = deformable_mean_in_out(frame, snake, normals, neighbours)
%   Gets a mean inside and outside a snake with regards to only neighbouring pixels
%   to snake points, instead of taking a mean average inside and outside a
%   curve. It's a special case for the nerves dataset.

    
    step_size = 1;
    m_in = zeros(size(snake, 1), 1);
    m_out = zeros(size(snake, 1), 1);
    for i=1:size(snake, 1)
        pixels_out = zeros(neighbours, 1);
        pixels_in = zeros(neighbours, 1);
        for j=1:neighbours
            pixels_out(j) = frame(floor(snake(i, 2)-j*step_size*normals(i, 2)), floor(snake(i, 1)-j*step_size*normals(i, 1)));
        end
        for j=1:neighbours
            pixels_in(j) = frame(floor(snake(i, 2)+j*step_size*normals(i, 2)), floor(snake(i, 1)+j*step_size*normals(i, 1)));
        end
        m_out(i) = mean(pixels_out);
        m_in(i) = mean(pixels_in);
    end

%     lines = zeros(size(snake));
%     for i=1:size(snake, 1)
%         coefficients = polyfit([snake(i,1), snake(i,1)+normals(i,1)], ...
%                                [snake(i,2), snake(i,2)+normals(i,2)], 1);
%         lines(i,:) = coefficients;
%         if (pi/2)<atan2(normals(i, 2), normals(i, 2)) && atan2(normals(i, 2), normals(i, 2))<(pi/2)
%             neighbours_values_in = zeros(8, 1);
%             for j=1:neighbours
%                 x_index_in = snake(i)-j;
%                 y_index_in = lines(i, 1)*x_index_in + lines(i,2);
%                 neighbours_values_in(i) = snake(x_index_in, y_index_in);
%             end
%             mean_in = mean(neighbours_values_in);
%             neighbours_values_out = zeros(8, 1);
%             for j=1:neighbours
%                 x_index_out = snake(i)+j;
%                 y_index_out = lines(i, 1)*x_index_out + lines(i,2);
%                 neighbours_values_out(i) = snake(x_index_out, y_index_out);
%             end
%             mean_out = mean(neighbours_values_out);
%             
%             
%         else
%             neighbours_values_in = zeros(8, 1);
%             for j=1:neighbours
%                 x_index_in = snake(i)+j;
%                 y_index_in = lines(i, 1)*x_index_in + lines(i,2);
%                 neighbours_values_in(i) = snake(x_index_in, y_index_in);
%             end
%             mean_in = mean(neighbours_values_in);
%             neighbours_values_out = zeros(8, 1);
%             for j=1:neighbours
%                 x_index_out = snake(i)-j;
%                 y_index_out = lines(i, 1)*x_index_out + lines(i,2);
%                 neighbours_values_out(i) = snake(x_index_out, y_index_out);
%             end
%             mean_out = mean(neighbours_values_out);
%         end
%     end
end

