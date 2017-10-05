function [ BackPointerList,NEW, OPEN, CLOSED, h,k,b ] = INIT_PLAN( node, goal , NEW, OPEN, CLOSED, actions, h,k,b,Obs, all_Obs)
%[ kmin,NEW,OPEN,CLOSED,h,k,b ] = process_state( NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs)
kmin = 0;
while (kmin ~= -1) || inList(node,CLOSED)
    [kmin ,NEW , OPEN, CLOSED,h,k,b] = process_state( NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs);
end
BackPointerList = GET_BACKPOINTER_LIST(b,node,goal);


end

