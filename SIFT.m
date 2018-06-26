function all = clustering(imageset, tot)
    all = [];
    for i = 1:tot
        img = [imageset 'image_' sprintf('%04d',i) '.jpg'];
    %     figure;imshow(img);
        temp = imread(img);
        if (size(temp, 3) == 3) 
            temp = rgb2gray(temp);
        end
        [f, d] = vl_sift(single(temp));
        all = [all; d'];
    end
    all = double(all);
end
