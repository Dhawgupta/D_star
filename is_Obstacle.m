function [ isobs ] = is_Obstacle(point, mode,obstacles,all_obstacles)
%Returns a true value if the mentioned point is an obstacle
% point
% mode
% 
% obstacles = [2,2;2,3;2,4;2,5;
%               1,2;1,3;1,4;1,5;
%               3,1];
% obstacles = obstacles + 1;
% 
% all_obstacles = [2,2;2,3;2,4;2,5;
%               1,2;1,3;1,4;1,5;
%               3,1 ; 3,2  ];% this contains the list of the real obstacles that the algorthm can encounter
% all_obstacles = all_obstacles + 1;

isobs = false;
if mode == 1
%     is_obstacle = false;
    for j=1:size(obstacles,1)
        if norm(point - obstacles(j,:))==0
            isobs = true;
            break;
        end
    end
end    
if mode == 2
    for j=1:size(all_obstacles,1)
        if norm(point - all_obstacles(j,:))==0
            isobs = true;
            break;
        end
    end
        
end

end

