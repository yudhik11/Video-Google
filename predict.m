function [I] = predict(img, ranking, clusters)
    [f, d] = vl_sift(single(rgb2gray(img)));
    d= double(d');
    t=[];
    num_clusters = size(clusters, 1);
    for i=1:size(d, 1)
        clust =0;
        min = 100000000;
        for j=1:num_clusters
            D  = sum((clusters(j, :) - d(i, :)) .^ 2);
            if D<min
                min=D;
                clust = j;
            end
        end
        t= [t clust];
    end
    ans = ranking(t, :);
    imgs = [];
    for i = 1:size(ans,2)
        imgs = [imgs sum(ans(:,i))];
    end
    [~,I] = sort(imgs,'descend');
    I = I(1:5);
end