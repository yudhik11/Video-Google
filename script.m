%% Google Images

clear all;
data = '/home/yudhik/study/Video-Google/frames/';
num_images = 100;
num_clusters = 1000;
tic
[all_features img_features] = SIFT(data, num_images);
toc
[idx, clusters] = kmeans(all_features, num_clusters, 'Maxiter', 100, 'Display', 'iter');

ranking = tf_idf(num_images, num_clusters, img_features, idx);

img = imread('/home/yudhik/study/Video-Google/test-1.png');

imgs = predict(img, ranking, clusters);

for i = 1:size(imgs,2)
    tmp = [data 'frame' sprintf('%d',imgs(i)) '.png'];
    figure; imshow(tmp);
end


%% matching features across images

img1 = imread('/home/yudhik/study/Video-Google/frames/frame25.png');
img2 = imread('/home/yudhik/study/Video-Google/frames/frame28.png');
[f1, d1] = vl_sift(single(rgb2gray(img1)));
[f2, d2] = vl_sift(single(rgb2gray(img2)));
d = [d1'; d2'];
[matches, scores] = vl_ubcmatch(d1, d2) ;

%% plotting the features on the image
img = imread('/home/yudhik/study/Video-Google/frame1.png');
[f, d] = vl_sift(single(rgb2gray(img)));
imshow(img);
idx = [1:size(f,2)];
h1 = vl_plotframe(f(:,idx)) ;
h2 = vl_plotframe(f(:,idx)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;
