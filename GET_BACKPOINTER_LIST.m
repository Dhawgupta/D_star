function [BackPointerList] = GET_BACKPOINTER_LIST(b,node,goal)
%[ kmin,NEW,OPEN,CLOSED,h,k,b ] = process_state( NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs)
BackPointerList = [];
while norm( node - goal) == 0
    BackPointerList = [BackPointerList;node];
    temp = node;
    node(1) = b(temp(1), temp(2), 1);
    node(2) = b(temp(1), temp(2), 2);

end

return


end

