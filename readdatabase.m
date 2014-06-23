%-----------------connect database-------------------
%dexplore
conna=database('Mdatabase','chen','111');
ping(conna);
%--------------------------select project--------------返回数据类型为 struct -------------
curs=exec(conna,'select project from character');    %project 为投影
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
%-----------------根据pageID查找 相同pageID 的字符characterID-----------这里要注意引号的用法----------
curs=exec(conna,'select characterID projection from character where pageID=''0610000700000053''');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%---------------------查标签为*字的信息-------------------------------
curs=exec(conna,'select * from character where label=''领''');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%----------------查characterID=2793的字符信息---------------------
curs=exec(conna,'select * from character where characterID=2793');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
%---------------------查询复杂度 -------------------------------
curs=exec(conna,'select complexity_x,complexity_y from character');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Complex_x=res.complexity_x;
Complex_y=res.complexity_y;
%---------------------查询direction -------------------------------
curs=exec(conna,'select direction from character');  
curs=fetch(curs);
res=curs.Data;
setdbprefs('datareturnformat','structure');
Direc=res.direction;

close(curs);
close(conna);