--table space ����
SELECT *
FROM DBA_DATA_FILES;

CREATE TABLESPACE TS_DBSQL
DATAFILE 'E:\B_UTIL\4.ORACLE\APP\ORACLE\ORADATA\XE\TB_DBSQL.DBF'
SIZE 100M 
AUTOEXTEND ON;


--����� �߰�
create user JISOO identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL
quota 0m on system;

--����, ������ȯ
GRANT CONNECT, RESOURCE TO JISOO;