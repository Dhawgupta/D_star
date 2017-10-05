function [ N,O,C,h,k ] = INSERT( n, val ,N,O,C,h,k) % the node(n) and the corresponding H value
%INserts the node into open list updating the h,k and Lsts
if inList(n, N)
    k(n(1), n(2)) = val;
    N = removeList(n,N);
elseif inList(n,O,2)
    k(n(1),n(2)) = min(k(n(1),n(2)),val);
    
elseif inList(n, C)
    k(n(1),n(2)) = min(h(n(1),n(2)),val);
    C = removeList(n,C);
    
end

h(n(1),n(2)) = val;
O.push(k(n(1),n(2)),n)

    


end

