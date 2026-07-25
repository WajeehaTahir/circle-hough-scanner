clc;
clear all;
close all;

root_directory = "input";

dir_info = dir(fullfile(root_directory));
dir_info([dir_info.isdir]) = [];
n_files = length(dir_info);

results = zeros(4,2);
verbose = true;

for i = 1:1
    filename = fullfile(root_directory, dir_info(i).name);
    %image = imread(filename);
    image = imread("input\1.jpg");
    results = results + processor(image, verbose);
end

disp("Processed " + num2str(n_files) + " images")

for i = 1:4
    disp("Question " + i + ": A = " + num2str(results(i,1)) + "     B = " + num2str(results(i, 2)));
end
