A = imread('ax.jpg');
B = imread('ax.jpg');
C = isequal(A,B)
if C==0
msgbox('Both the images are not same');
else
msgbox('Both the images are same');
end

