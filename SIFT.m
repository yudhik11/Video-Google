function [all, img_features] = SIFT(imageset, tot)
    all = [];
    img_features = [];
    for i = 1:tot
        img = [imageset 'frame' sprintf('%d',i) '.png'];
%          figure;imshow(img);
        temp = imread(img);
        if (size(temp, 3) == 3) 
            temp = rgb2gray(temp);
        end
        [f, d] = vl_sift(single(temp));
        all = [all; d'];
        img_features = [img_features size(d',1)];
    end
    all = double(all);
end
