x=videoinput('winvideo',1);
for i=1:1
    img=getsnapshot(x);
    fname=['Image',num2str(i)];
    imwrite(img,fname,'jpg');
    pause(2);
end
i = imread('Image1');
I = rgb2gray(i);
BW1 = edge(I,'prewitt');
BW2= edge(I,'sobel');
BW3= edge(I,'canny');
subplot (2,2,1);
imshow(I);
title('original');
subplot(2,2,2); 
imshow(BW1);
title('Prewitt');
subplot(2,2,3);
imshow(BW2);
title('Sobel');
subplot(2,2,4);
imshow(BW3); 
title('Canny');

