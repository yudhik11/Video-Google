function ranking = tf_idf(num_images, num_clusters, img_features, idx)
    ranking = zeros(num_clusters, num_images);
    for i = 1:size(img_features, 2)
        cluster = sum(img_features(1:i-1));
        val = 0;
        for j = 1:img_features(i)
            val = val+1;
            ranking(idx(cluster+j), i)= ranking(idx(cluster+j), i)+1;
        end
    end 
end
