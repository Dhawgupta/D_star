function [ list, tf ] = removeList( coordinate , list )
% remove a coordinate from a list
is_true = false;
            for j=1:size(list,1)
               if norm(coordinate - list(j,:))==0
                    is_true = true; % dawg - small error in the program we should modigy yhr f_value if the favalue is better than earlier
                    list(j,:) = [];
					break;
                end
            end
       tf = is_true;

end

