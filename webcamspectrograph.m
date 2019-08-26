%%matlab web cam spectrograph
%Rahulpunk
obj=videoinput('winvideo', 1, 'YUY2_640x480');
src = getselectedsource(obj);
    obj.ReturnedColorspace ='rgb';
B=getsnapshot(obj);

framesAcquired = 0;
fontsize=20;
while (framesAcquired <=10); 
    
      data = getsnapshot(obj); 
      framesAcquired = framesAcquired + 1;    
      

    % Display the image
    imshow(data);

    subplot(2, 3, 1);
  
  
 

imshow(data ) ;
[y,x] = find(data) ;
x0 = min(x) ; x1 = max(x) ;
y0 = min(y) ; y1 = max(y) ;
%%Form a rectangle 
B = x1-x0 ;   % horizontal length 
L = y1-y0 ;   % vertical length
L0 = 0 ;  % specified length, change as you wish  
if L > L0
    dL = L-L0 ;
end
data(x0+dL:end,:) = 0 ;
imshow(data );
    subplot(2, 3, 1);

set (gcf,'position',get(0,'screensize'));

imshow(data, []);
axis on;
leftColumn = min(x);
rightColumn = max(x);
topLine = min(y);
bottomLine = max(y);
width = rightColumn - leftColumn + 1;
height = bottomLine - topLine + 1;
croppedImage = imcrop(data, [leftColumn, topLine, width, height]);
subplot(2, 3, 2);
imshow(croppedImage);
axis on;
title(' inputImage','fontsize', fontsize);

croppedImageImagevector1=croppedImage(:);

croppedImagevector1=croppedImage(:);
subplot(2, 3, 3);

imshow(croppedImage)
x=[0   100];
y=[0   100];
improfile(croppedImage,x,y);
grid on;

title('spectrograph','fontsize', fontsize);
s=nonzeros(croppedImage);

s=mean(s);
p=s*2;

disp(p)

 subplot(2, 3, 4);

 bar(croppedImage(1:48,608:640),'DisplayName','croppedImage(1:48,608:640)');figure(gcf);

   subplot(2, 3, 5);


axis on;
title('original Image','fontsize', fontsize);

end


% Read in image into an array.
subplot(2, 3, 6);

rgbImage = imshow(croppedImage); 
axis on;
title(' rgbImage','fontsize', fontsize);

[rows, columns, numberOfColorBands] = size(rgbImage); 
% Display it.
subplot(2, 3, 1);
imshow(rgbImage, []);