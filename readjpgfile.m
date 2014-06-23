%-------------read *.jpg file-----------------
filepath='E:\Workspace\ClassProject\';
allfiles=dir(fullfile(filepath,'*.jpg'));
filenum=length(allfiles);
str=allfiles(1).name;
%[name,type]=strtok(str,'.');type(1)=[];
fullname=strcat(filepath,str);
data=imread(fullname);
data=rgb2gray(data);
data=im2double(data);
%--------------normalization 45*45-------------------------
NorImage=imresize(data,[45,45]);
figure(1);
subplot(1,2,1);imshow(data);title('原图');
subplot(1,2,2);imshow(NorImage);title('归一化45*45');
hold on;
%--------------------binary-------------
thresh=graythresh(NorImage);
BinImage=im2bw(NorImage,thresh);
figure(2);
subplot(1,2,1);imshow(NorImage);title('归一化图');
subplot(1,2,2);imshow(BinImage);title('二值化后');
hold on;
%------------生成图像projection-----------------
Pro_x=zeros(1,45);
Pro_y=zeros(1,45);
for i=1:45
    for j=1:45
        if BinImage(i,j)==0
            Pro_x(i)=Pro_x(i)+1;
            Pro_y(j)=Pro_y(j)+1;
        end
    end
end
figure(3);
subplot(1,2,1);bar(Pro_y,'grouped');title('横向投影');
subplot(1,2,2);bar(Pro_x,'grouped');title('纵向投影');
hold on;
%-----------------histogram-------------
[Imagehgram_x,x]=imhist(NorImage);
[Imagehgram_y,x]=imhist(NorImage');
%figure(4);
%subplot(1,2,1);bar(Imagehgram_x,'grouped');title('横向投影');
%subplot(1,2,2);bar(Imagehgram_y,'grouped');title('纵向投影');
%hold on;
%-----------------edge detect-----------------
BW=edge(data,'canny');
figure(4);
subplot(1,2,1);imshow(data);title('原图');
subplot(1,2,2);imshow(BW);title('边缘检测');
hold on;
