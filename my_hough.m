function [H] = my_hough(input_img) 
    [w, h] = size(input_img);
    r_max = ceil(hypot(w, h));
    H = zeros( 2*r_max+ 1 , 180);

     for i = 1:w
        for j = 1:h
            if input_img(i, j) ~= 0
                for theta = 1:180
                    r = round(i*cosd(theta) + j*sind(theta), 0);
                    H(r + r_max + 1, theta) = H(r + r_max + 1, theta) + 1;
                end
            end
        end
    end
end
