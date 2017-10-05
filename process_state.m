function [ kmin,NEW,OPEN,CLOSED,h,k,b ] = process_state( NEW,OPEN, CLOSED ,actions,h,k,b, Obs, all_Obs)
%Process state function to process the state 
%Top K elemnet
if size(OPEN,1) == 0
    kmin = -1;
    return
    
node = OPEN(1,:);
kmin = k(node(1),node(2));
OPEN = removeList(node, OPEN);

% the first condition 
if kmin < h(node(1),node(2))
     for i=1:size(actions,1)
        delta_movement = actions(i,:);
        neighbor_node_pos = node + delta_movement;
        if ~inList(neighbor_node_pos, NEW) && h(neighbor_node_pos(1), neighbor_node_pos(2)) <= kmin && h(node(1), node(2)) > h(neighbor_node_pos(1), neighbor_node_pos(2)) + cost(neighbor_node_pos,node,1,Obs,all_Obs) 
            b(node(1),node(2),1) = neighbor_node_pos(1);
			b(node(1), node(2),2) = neighbor_node_pos(2);
            h(node(1), node(2)) = h(neighbor_node_pos(1), neighbor_node_pos(2)) + cost(neighbor_node_pos,node,1,Obs,all_Obs)
        end
     end
end
% second condition for the robot kold = h(X)
if kmin == h(node(1),node(2)) % here node is bascailly X
	for i=1:size(actions,1)
        delta_movement = actions(i,:);
        nnode = node + delta_movement;
        if inList( nnode, NEW) || ...
			b(nnode(1), nnode(2),1) == node(1) && b(nnode(1), nnode(2),2) == node(2) && h(nnode(1),nnode(2)) ~= h(node(1),node(2)) + cost(nnode,node,1, Obs, all_Obs) || ...
			(b(nnode(1), nnode(2),1) ~=  node(1) || b(nnode(1), nnode(2),2) ~= node(2)) && ...
			h(nnode(1),nnode(2)) > h(node(1),node(2)) + cost(nnode,node,1, Obs, all_Obs)
			
			% body of if
			b(nnode(1),nnode(2),1) = node(1);
			b(nnode(1), nnode(2),2) = node(2);
            INSERT(nnode, h(node(1), node(2)) + cost(node, nnode, 1, Obs, all_Obs))
			
        end
     end
else
	for i=1:size(actions,1)
        delta_movement = actions(i,:);
        nnode = node + delta_movement;
        if inList( nnode, NEW) || ...
			b(nnode(1), nnode(2),1) == node(1) && b(nnode(1), nnode(2),2) == node(2) && h(nnode(1),nnode(2)) ~= h(node(1),node(2)) + cost(nnode,node,1, Obs, all_Obs) %|| ...
			
			% body of if
			b(nnode(1),nnode(2),1) = node(1);
			b(nnode(1), nnode(2),2) = node(2);
            INSERT(nnode, h(node(1), node(2)) + cost(node, nnode, 1, Obs, all_Obs))
		else
			if (b(nnode(1), nnode(2),1) ~=  node(1) || b(nnode(1), nnode(2),2) ~= node(2)) && ...
			   h(nnode(1),nnode(2)) > h(node(1),node(2)) + cost(nnode,node,1, Obs, all_Obs)
				
				% body of the function
				INSERT(node, h(node(1), node(2)))
			else
				if (b(nnode(1), nnode(2),1) ~=  node(1) || b(nnode(1), nnode(2),2) ~= node(2)) && ...
			        h(node(1),node(2)) > h(nnode(1),nnode(2)) + cost(node,nnode,1, Obs, all_Obs) && ...
					inList(nnode, CLOSED) && h(nnode(1), nnode(2)) > kmin 
					
					% body of the thing
					INSERT(nnode, h(nnode(1), nnode(2)))
					
				
				end
			end
        end
     end
end


if size(OPEN,1) == 0
   kmin = -1
else
    kmin = k(OPEN(1,1), OPEN(1,2));


return

   

end

