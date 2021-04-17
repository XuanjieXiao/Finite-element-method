% clc;
% clear all;
datasource = 'MySQL80';
conn = database(datasource,'root','123456789');
createtabeldes = 'create table aaa (names char(8),aged char(8))'
exec(conn,createtabeldes);
% coatablename = 'coa.aaa';
% coatablecolumnname = table({'adad'},{'adadaaa'})
% cell0=table2cell(coatablecolumnname);
% [m,n]=size(cell0);
% m
% n
%     createtabeldes=strcat('createtable',32,coatablename,32,'("blank"');
%     for j=1:n
%         createtabeldes=strrep(createtabeldes,'blank',cell0{1,j});
%         createtabeldes=strcat(createtabeldes,',"blank"');
%     end
%     createtabeldes=strrep(createtabeldes,',"blank"',')');
%     disp(createtabeldes);
%     disp(class(describe));
   