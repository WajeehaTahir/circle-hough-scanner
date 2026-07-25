function [H, centers] = circle_hough(input_img, radius, k)
    H = zeros(size(input_img));

    for x = 1:size(input_img, 1)
        for y = 1:size(input_img, 2)
            if input_img(x, y) ~= 0
                for theta = 0:360
                    b = abs(round(x-radius*sind(theta)));
                    a = abs(round(y-radius*cosd(theta)));

                    if a>0 && a<=size(input_img,2) && b > 0 && b<=size(input_img,1)
                        H(b, a) = H(b, a) + 1;
                    end
                end
            end
        end
    end

    centers = [];
    temp = H;

    for i = 1:k
        [~, indices] = max(temp(:));
        [x, y] = ind2sub(size(temp), indices);

        mask = 40;

        temp(x-mask:x+mask,y-mask:y+mask) = 0;
        centers = [centers; [y, x]];
    end
end
