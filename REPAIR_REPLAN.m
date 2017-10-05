function [ P,NEW , OPEN, CLOSED,h,k,b] = REPAIR_REPLAN( node, goal , NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs )
% kmin = 0;
kmin = -Inf;
while (kmin ~= -1) || (kmin > h(node(1),node(2)))
    [kmin ,NEW , OPEN, CLOSED,h,k,b] = process_state( NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs);
end
% P is the back pointer
P = [];
P = GET_BACKPOINTER_LIST(b,node, goal);
end
