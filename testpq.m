clc;
clear;
OPEN = PriorityQueue();
OPEN.push(0.5, [0,0]);
OPEN.push(1.5, [1,0]);
OPEN.push(0., [2,0]);
%%
OPEN.pop()
OPEN.pop()
OPEN.pop()