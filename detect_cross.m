function [is_cross_present] = detect_cross(image)
    image = image > 170;
    image = edge(image, "sobel");
    
    non_max_sup__k = 2;
    non_max_sup__p = 15;
    H = my_hough(image);
    [R, T] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
    
    is_cross_present = 0;
    
    if abs(T(1) - T(2)) < 120 && abs(T(1) - T(2)) > 50
        is_cross_present = 1;
    end
    
end