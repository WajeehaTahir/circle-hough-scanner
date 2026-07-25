function [r_vect, t_vect] = non_max_sup(A, k, p)
    r_vect = [];
    t_vect = [];

    while k > 0
        [val, index] = max(A(:));
        [r, theta] = ind2sub(size(A), index);
        
        r_vect = [r_vect, r];
        t_vect = [t_vect, theta];

        x1 = max(1, r - p);
        x2 = min(r + p, size(A, 1));

        y1 = max(1, theta - p);
        y2 = min(theta + p, size(A, 2));

        A(x1:x2, y1:y2) = 0;

        k = k - 1;
    end

end



