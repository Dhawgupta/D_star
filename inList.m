function [ tf ] = inList( coordinate , list , mode)
% check if a corrdinate is in a list or not
if nargin < 3
    mode = 1;
end

is_true = false;
if mode == 1
            for j=1:size(list,1)
               if norm(coordinate - list(j,:))==0
                    is_true = true; % dawg - small error in the program we should modigy yhr f_value if the favalue is better than earlier
                    break;
                end
            end
end

if mode == 2
            for j=1:list.size()
               if norm(coordinate - list.getUserData(j).pos)==0
                    is_true = true; % dawg - small error in the program we should modigy yhr f_value if the favalue is better than earlier
                    break;
                end
            end
end

 tf = is_true;
end

