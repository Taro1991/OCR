%-----------------connect database-------------------
%dexplore
conna=database('Mdatabase','chen','111');
ping(conna);
%--------------------------select project--------------������������Ϊ struct -------------
curs=exec(conna,'select project from character');    %project ΪͶӰ
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Pro=res.project;
%--------------------character ID---------------
curs=exec(conna,'select characterID from character');
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
CharID=res.characterID;
%-----------------����pageID���� ��ͬpageID ���ַ�characterID-----------����Ҫע�����ŵ��÷�----------
curs=exec(conna,'select characterID projection from character where pageID=''0610000700000053''');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%---------------------���ǩΪ*�ֵ���Ϣ-------------------------------
curs=exec(conna,'select * from character where label=''��''');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%----------------��characterID=2793���ַ���Ϣ---------------------
curs=exec(conna,'select * from character where characterID=2793');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%---------------------��ѯ���Ӷ� -------------------------------
curs=exec(conna,'select complexity_x,complexity_y from character');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Complex_x=res.complexity_x;
Complex_y=res.complexity_y;
%---------------------��ѯdirection -------------------------------
curs=exec(conna,'select direction from character');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Direc=res.direction;

close(curs);
close(conna);