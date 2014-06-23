%-----------------connect database-------------------
%dexplore
conna=database('Mdatabase','chen','111');
ping(conna);
%-----------------根据pageID查找 相同pageID 的字符characterID-----------这里要注意引号的用法----------
curs=exec(conna,'select characterID,pageID,label,project from character where pageID=''0610000700000053''');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Label=res.label;
Pro=res.project;
%----------------这里只是测试 领 这个图片的投影-----------------
Project=zeros(1,90);  
str=Pro{23};
len=length(str);
resnum=0;i=1;j=1;
while i<=len              % read project from database
    if(str(i)==',') 
        Project(j)=resnum;
        j=j+1;
        resnum=0;
    else
        resnum=resnum*10+str2num(str(i));
    end
    i=i+1;      
end
project_x=Project(1:45);
project_y=Project(46:90);
figure(1);
subplot(1,2,1);bar(project_x,'grouped');title('横向投影');
subplot(1,2,2);bar(project_y,'grouped');title('纵向投影');
hold on;