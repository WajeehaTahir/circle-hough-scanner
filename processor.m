function [data] = processor(image, verbose)
    if nargin == 1
        verbose = false;
    end
    
    image_enhanced = rgb2gray(image);
    image_enhanced = imadjust(image_enhanced);  % Histogram operations

    rotation_angle = find_rotation_angle(image_enhanced);
    rotated_image = imrotate(image_enhanced, 90-rotation_angle);

    if verbose
        figure;
        subplot(1, 2, 1);
        imshow(image);
        title("Original input image");

        subplot(1, 2, 2);
        imshow(edge(rotated_image));
        title("Straightened edge image");
    end

    radii = 37;
    [H, centers] = circle_hough(edge(rotated_image, "canny", 0.6), radii, 8);
    
    if verbose
        figure;
        subplot(1, 2, 1);
        imshow(rotated_image);
        hold on;
        viscircles(centers, radii,'EdgeColor','r');
        hold off;
        title("Straightened original image with circles");

        subplot(1, 2, 2);
        imagesc(H);
        colorbar;
        title('Hough space');
    end

    data = process_circles(verbose, centers, radii, rotated_image);
end
