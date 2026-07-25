function [data] = process_circles(verbose, centers, radii, image)
    x_indices = sort(centers(:, 1));
    y_indices = sort(centers(:, 2));
    
    data = zeros(4, 2);

    if verbose
        figure;
    end

    for i = 1:8
        center = centers(i, :); 
        radius = radii - 15;
        
        top_left = [round(center(1) - radius), round(center(2) - radius)];
        bottom_right = [round(center(1) + radius), round(center(2) + radius)];
        cropped_image = image(top_left(2):bottom_right(2), top_left(1):bottom_right(1));
        cropped_image_aesthetic = image(top_left(2)-25:bottom_right(2)+25, ...
            top_left(1)-25:bottom_right(1)+25); % added padding for displaying the entire circle

        col = ceil(find(x_indices==center(1))/4); col = col(1);   % find index of value in sorted list and map to 4x2
        row = ceil(find(y_indices==center(2))/2); row = row(1);

        index = (row-1)*2 + col;

        data(row, col) = detect_cross(cropped_image);

        if verbose
            subplot(4, 2, index);
            imshow(cropped_image_aesthetic);

            text = "false";
            if data(row, col)
                text = "true";
            end

            title(text);
        end
    end
end
