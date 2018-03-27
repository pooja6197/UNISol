x=videoinput('winvideo',1);
for i=1:1
    img=getsnapshot(x);
    fname=['Image',num2str(i)];
    imwrite(img,fname,'jpg');
    pause(2);
end
i = imread('Image1');
I = rgb2gray(i);
BW1 = edge(I,'canny');
imshow(I);
imshow(BW1);
