clear all;
close all;
clc;
camList = webcamlist;
cam=webcam(1);
%preview(cam);
for i=1:1
    img = snapshot(cam);
    fname=['Image',num2str(i)];
    imwrite(img,fname,'jpg');
    pause(1);

i1 = imread('Image1');
I = rgb2gray(i1);
% BW1 = edge(I,'canny');
% imshow(I);
% imshow(BW1);
i1=rgb2gray(imread('Image1'));

myFolder = 'C:\Users\Pooja V\Documents\MATLAB';
% if ~isdir(myFolder)
%   errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
%   uiwait(warndlg(errorMessage));
%   return;
% end
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
%   fprintf(1, 'Now reading %s\n', fullFileName);
  imageArray = imread(fullFileName);
%   I = rgb2gray(imageArray);
% BW2 = edge(I,'canny');
% imshow(I);
% imshow(BW2);
i1=rgb2gray(imread('Image1'));
i2=rgb2gray(imread(fullFileName));
% imshow(i1);
% imshow(i2);

end
points1 = detectSURFFeatures(i1);
points2 = detectSURFFeatures(i2);
[features1,valid_points1] = extractFeatures(i1,points1);
[features2,valid_points2] = extractFeatures(i2,points2);
indexPairs = matchFeatures(features1,features2);

if(indexPairs)
       
        msgbox('The gun is found in the image');
 
        
        
else 
    
          msgbox('The gun is not found in the image');
          
       
          
end
   beep();
        beep('on')
        sounding = beep();
matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);
% figure; 
% showMatchedFeatures(i1,i2,matchedPoints1,matchedPoints2,'montage');
end