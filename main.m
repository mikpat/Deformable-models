clear all
clc
close all

%% Reading input data 
data = zeros(350,350,100);
data_without_gauss = zeros(350,350,100);

for i=1:100
    name = ("Data/" + int2str(i) + ".bmp");
    data_without_gauss(:,:,i)= imread(name, 'bmp');
end


%% Apply Gaussian filter

for i=1:100
    data(:,:,i)= imgaussfilt(data_without_gauss(:,:,i));
end

%% Snake init 1

snake_1 = snake_init( 130, 260, 20, 50);
snake_2 = snake_init( 240, 50, 23, 50);
snake_3 = snake_init( 230, 280, 18, 50);

figure(1)
hold on
imagesc(data(:,:,1));
viscircles(snake_1, ones(size(snake_1, 1), 1), 'Color','r');
viscircles(snake_2, ones(size(snake_2, 1), 1), 'Color','b');
viscircles(snake_3, ones(size(snake_3, 1), 1), 'Color','g');
hold off

%% Internal forces parameters

L1 = generate_L([0, 1, -2, 1, 0], size(snake_1, 1));
L2 = generate_L([-1, 4, -6, 4, -1], size(snake_1, 1));

alpha_1 = 0.6;
beta_1 =0.2;
F_int_1 = inv(eye(size(snake_1, 1)) - alpha_1*L1 - beta_1*L2);

alpha_2 = 0.8;
beta_2 = 0.2;
F_int_2 = inv(eye(size(snake_1, 1)) - alpha_2*L1 - beta_2*L2);

alpha_3 = 0.6;
beta_3 =0.2;
F_int_3 = inv(eye(size(snake_1, 1)) - alpha_3*L1 - beta_3*L2);


%% External forces parameters

% depends on circle size
neighbours_1 = 10;
neighbours_2 = 4;
neighbours_3 = 8;
% displacement step for external forces
disp_step_1 = 0.1;
disp_step_2 = 0.12;
disp_step_3 = 0.1;


%% Main loop

for i=1:2:size(data, 3)
    
    frame = data(:,:,i);
    
    % Move snake according to internal and external forces
    snake_ext_1 = force_ext(snake_1, frame, disp_step_1, neighbours_1 );
    snake_ext_int_1 = F_int_1*snake_ext_1;
    snake_ext_int_1 = round(remove_crossings(snake_ext_int_1));
    
    snake_ext_2 = force_ext(snake_2, frame, disp_step_2, neighbours_2 );
    snake_ext_int_2 = F_int_2*snake_ext_2;
    snake_ext_int_2 = round(remove_crossings(snake_ext_int_2));
    
    snake_ext_3 = force_ext(snake_3, frame, disp_step_3, neighbours_3 );
    snake_ext_int_3 = F_int_3*snake_ext_3;
    snake_ext_int_3 = round(remove_crossings(snake_ext_int_3));


    % Draw points and displacement vectors
    snakes = zeros(size(snake_1, 1), size(snake_1, 2), 3);
    snakes(:,:, 1) = snake_1;
    snakes(:,:, 2) = snake_2;
    snakes(:,:, 3) = snake_3;
    snakes_ext_int = zeros(size(snake_ext_int_1, 1), size(snake_ext_int_1, 2), 3);
    snakes_ext_int(:,:, 1) = snake_ext_int_1;
    snakes_ext_int(:,:, 2) = snake_ext_int_2;
    snakes_ext_int(:,:, 3) = snake_ext_int_3;
    display_snakes(data_without_gauss(:,:,i), snakes, snakes_ext_int, i);
    
    
    snake_1 = snake_ext_int_1;
    snake_2 = snake_ext_int_2;
    snake_3 = snake_ext_int_3;

    pause(0.02);

end




