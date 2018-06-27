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
    rarity = [];
    for i=1:num_clusters
        rarity = [rarity (sum(ranking(i, :) > mean(ranking(i, :))))];
    end
    for i = 1:num_clusters
        for j = 1:num_images
            ranking(i, j) = (ranking(i,j)/img_features(j))... %%term_frequency = num_of_features belong to that cluster
                            * (log(num_images/rarity(i))); %% idf = Num_of_images which possess that cluster
        end
    end 
end
