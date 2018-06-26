clear all;
data = '/home/yudhik/study/Video-Google/frames';
num_images = 5;
all_features = sift(data, num_imgaes);

[idx, clusters] = kmeans(all_features, 100);









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
sel = perm(1:1000) ;
h1 = vl_plotframe(f(:,sel)) ;
h2 = vl_plotframe(f(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;
