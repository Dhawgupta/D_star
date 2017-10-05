function [ N,O,C,h,k ] = INSERT( n, val ,N,O,C,h,k) % the node(n) and the corresponding H value
%INserts the node into open list updating the h,k and Lsts
if inList(n, N)
    k(n(1), n(2)) = val;
    N = removeList(n,N);
    O = [O; n];
elseif inList(n,O)
    k(n(1),n(2)) = min(k(n(1),n(2)),val);
    
elseif inList(n, C)
    k(n(1),n(2)) = min(h(n(1),n(2)),val);
    C = removeList(n,C);
    C = [C;n];
end
,NEW,OPEN,CLOSED,h,k
h(n(1),n(2)) = val;
% now we need to sort the open list to make it a Priority Queue
if size(O,1) == 1
    return
% sorting the open list 

for i = 1:size(O,1)-1
    for j = i+1:size(O,1)
        if k(O(i,1),O(i,2)) > k(O(j,1),O(j,2))
            temp = O(i,:);
            O(i,1) = O(j,1);
            O(i,2) = O(j,2);
            O(j,1) = temp(1);
            O(j,2) = temp(2);
        end
    end
end



end

