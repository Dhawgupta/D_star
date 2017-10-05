function [ Obs, NEW , OPEN, CLOSED,h,k,b] = PREPARE_REPAIR( node , NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs )
    for i=1:size(actions,1)
        delta_movement = actions(i,:);
        nnode = node + delta_movement;
        if cost(nnode, node,2,Obs,all_Obs) ~= cost(nnode, node, 2, Obs, all_Obs)
            [ kmin, Obs , NEW , OPEN , CLOSED,h,k ] = MODIFY_COST(nnode, node, Obs, all_Obs , NEW, OPEN, CLOSED,h,k  );
        end
    end
   
     %function [ val ] = cost( pto,pfrom,mode,obstacles,all_obstacles ) 

end
