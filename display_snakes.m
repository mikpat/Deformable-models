function display_snakes( frame, snakes, snakes_ext_int, figure_number )
% Draw points and displacement vectors

    figure(5)
    hold on
    imagesc(frame);
    
    for i=1:size(snakes, 3)
        snake = snakes(:,:,i);
        snake_ext_int = snakes_ext_int(:,:,i);
        viscircles(snake, 1*ones(size(snake, 1), 1),'Color','r');
        if i == 1
             viscircles(snake, 1*ones(size(snake, 1), 1),'Color','r');
        elseif i == 2
            viscircles(snake, 1*ones(size(snake, 1), 1),'Color','b');
        elseif i == 3
            viscircles(snake, 1*ones(size(snake, 1), 1),'Color','g');
        elseif i == 4
            viscircles(snake, 1*ones(size(snake, 1), 1),'Color','black');
        else
            viscircles(snake, 1*ones(size(snake, 1), 1),'Color','magenta');
        end
        
        for j=1:size(snake, 1)
            if i == 1
                line([snake(j,1), snake_ext_int(j,1)], ...
                     [snake(j,2), snake_ext_int(j,2)], ...
                     'Color','red'); 
            elseif i == 2
                line([snake(j,1), snake_ext_int(j,1)], ...
                     [snake(j,2), snake_ext_int(j,2)], ...
                     'Color','blue');
            elseif i == 3
                line([snake(j,1), snake_ext_int(j,1)], ...
                     [snake(j,2), snake_ext_int(j,2)], ...
                     'Color','green');
            elseif i == 4
                line([snake(j,1), snake_ext_int(j,1)], ...
                     [snake(j,2), snake_ext_int(j,2)], ...
                     'Color','black');
            else
                line([snake(j,1), snake_ext_int(j,1)], ...
                     [snake(j,2), snake_ext_int(j,2)], ...
                     'Color','magenta');
            end
                
        end
    end
    
    hold off
    
    saveas(5, strcat('results\', int2str(figure_number)), 'png');

end

