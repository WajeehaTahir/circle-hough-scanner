function [rotation_angle] = find_rotation_angle(image)
    edges = edge(image, "canny");
    ft = fftshift(fft2(edges));
    dft_phase = angle(ft);
    dft_magnitude = mat2gray(log(abs(ft)+1));
    dft_magnitude = edge(dft_magnitude, "canny", 0.7);

    canny_th = 0.17;
    non_max_sup__k = 1;
    non_max_sup__p = 3;

    E = edge(dft_magnitude, 'Canny', canny_th);
    H = my_hough(E);
    [~, rotation_angle] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
end