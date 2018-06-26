clear all;
data = '/home/yudhik/study/Video-Google/frames/';
num_images = 10;
num_clusters = 100;
[all_features img_features] = SIFT(data, num_images);

[idx, clusters] = kmeans(all_features, num_clusters, 'Maxiter', 100, 'Display', 'iter');
ranking = tf_idf(num_images, num_clusters, img_features, idx);

img = imread('/home/yudhik/study/Video-Google/frame27.png');

predict(img, ranking, clusters);







%%
SVM

img1 = imread('/home/yudhik/study/Video-Google/frames/frame25.png');
img2 = imread('/home/yudhik/study/Video-Google/frames/frame28.png');
[f1, d1] = vl_sift(single(rgb2gray(img1)));
[f2, d2] = vl_sift(single(rgb2gray(img2)));
d = [d1'; d2'];
[matches, scores] = vl_ubcmatch(d1, d2) ;
imshow(img);
perm = randperm(size(f,2)) ;
sel = perm(1:30) ;
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;
