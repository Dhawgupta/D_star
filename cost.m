function [ val ] = cost( pto,pfrom,mode,obstacles,all_obstacles ) % mode 1 is the normal world and mode = 2 is the sensor world cost
%TO calculate the costs
% 
% obstacles = [2,2;2,3;2,4;2,5;
%               1,2;1,3;1,4;1,5;
%               3,1];
% obstacles = obstacles + 1;
% 
% all_obstacles = [2,2;2,3;2,4;2,5;
%               1,2;1,3;1,4;1,5;
%               3,1 ;3,2  ];% this contains the list of the real obstacles that the algorthm can encounter
% all_obstacles = all_obstacles + 1;

% the obstacles are mentioned above 
isobs = is_Obstacle(pto,mode,obstacles,all_obstacles) || is_Obstacle(pfrom, mode,obstacles,all_obstacles);
if isobs
    val = Inf;
else
    val = norm(pto - pfrom);
end


end

