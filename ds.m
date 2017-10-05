clc;
clear;
close all;

obstacles = [2,2;2,3;2,4;2,5;
              1,2;1,3;1,4;1,5;
              3,1];
obstacles = obstacles + 1

all_obstacles = [2,2;2,3;2,4;2,5;
              1,2;1,3;1,4;1,5;
              3,1 ;3,2  ];% this contains the list of the real obstacles that the algorthm can encounter
all_obstacles = all_obstacles + 1

%%  
%%plot the world and path
daspect([1 1 1]);
axis([1 7 1 7]);
for i=1:7
    for j=1:7
        rectangle('Position',[i,j,1,1]);
    end
end
for j=1:size(obstacles,1)
    rectangle('Position',[obstacles(j,1),obstacles(j,2),1,1], 'FaceColor','k');    
end
%%
init_node_pos =  [1,1];
goal_node_pos = [6,6];
% init_node_pos =  [0,1];
% goal_node_pos = [6,1];


h = zeros(6,6);
k = zeros(6,6);
b = ones(6,6,2).*-1; % the backpointer cordintes
h(goal_node_pos(1), goal_node_pos(2)) = 0;
k(goal_node_pos(1), goal_node_pos(2)) = 0;
b(goal_node_pos(1), goal_node_pos(2),:) = [6,6];



% goal_node.pos = goal_node_pos;
% goal_node.h = 0;
% goal_node.k = 0;
% goal_node.b = [5,5];

%%
OPEN = PriorityQueue();
node = [-10,-10];
OPEN.push(inf,node);
OPEN.push(k(goal_node_pos(1), goal_node_pos(2)), goal_node_pos);
%%
%actions = [1,0; 0,1; -1,0; 0,-1];

actions = [1,0;1,1;0,1;-1,1;-1,0;-1,-1;0,-1;1,-1];

%%

%starts the timer
tic;
NEW = []; % the new list
for i = 1:6
    for j = 1:6
        NEW = [NEW;[i,j]];
    end
end
NEW = removeList(goal_node_pos, NEW);
%%
% to remove an element from list just do CLOSED(j,:) = []
CLOSED = [];
path = goal_node_pos;
%D* algorithm
while OPEN.size()>0
    current_node = OPEN.pop();
    
    current_node_pos = current_node.pos;
    if norm(current_node_pos - goal_node_pos)==0
        parent_node = current_node.parent;
        parent_node.pos
        while norm(parent_node.pos - init_node_pos)>0
            path = [path;parent_node.pos];
            parent_node = parent_node.parent;
        end
        break;
    end
    CLOSED = [CLOSED;current_node_pos];
    %expand
    for i=1:size(actions,1)
        delta_movement = actions(i,:);
        neighbor_node_pos = current_node_pos + delta_movement;
        %%check if intersects with an obstacle
        is_obstacle = false;
        for j=1:size(obstacles,1)
            if norm(neighbor_node_pos - obstacles(j,:))==0
                is_obstacle = true;
                break;
            end
        end
        %%check if closed already
        is_closed = false;
        for j=1:size(CLOSED,1)
            if norm(neighbor_node_pos - CLOSED(j,:))==0
                is_closed = true;
                break;
            end
        end
        if ~is_obstacle && ~is_closed
            neighbor_node_g_cost = current_node.gcost + norm([neighbor_node_pos-current_node_pos]);
            neighbor_node_h_cost = norm(neighbor_node_pos - goal_node_pos);
            neighbor_node_f_cost = neighbor_node_g_cost + neighbor_node_h_cost;
            neighbor_node.pos = neighbor_node_pos;
            neighbor_node.gcost = neighbor_node_g_cost;
            neighbor_node.hcost = neighbor_node_h_cost;
            neighbor_node.fcost = neighbor_node_f_cost;
            neighbor_node.parent = current_node;
            %is in OPEN 
            is_open = false;
            for j=1:OPEN.size()
               if norm(neighbor_node_pos - OPEN.getUserData(j).pos)==0
                    is_open = true; % dawg - small error in the program we should modigy yhr f_value if the favalue is better than earlier
                    break;
                end
            end
            if ~is_open
                OPEN.push(neighbor_node.fcost,neighbor_node);
            end
        end
    end    
end
path = [path;init_node_pos];
toc;

path_length = 0;
for j=1:size(path,1)
    hold on;
    plot(path(j,1)+.5,path(j,2)+.5,'bd');
    hold off;
    if j>1
        path_length = path_length + norm(path(j,:)-path(j-1,:));
    end
end
disp(strcat('Path length is : ',num2str(path_length)));
hold on;
plot(init_node_pos(1)+.5,init_node_pos(2)+.5,'rd');
plot(goal_node_pos(1)+.5,goal_node_pos(2)+.5,'gd');