SELECT ���� ���� :
��¥ ����(+, -) : ��¥ + ����, -���� : ��¥���� +-������ �� ���� Ȥ�� �̷������� ����Ʈ Ÿ�� ��ȯ
���� ����(....) : �����ð��� �ٷ��� ����...
���ڿ� ����
   ���ͷ� : ǥ����
           ���� ���ͷ� : ���ڷ� ǥ��
           ���� ���ͷ� : JAVA : "���ڿ�" / sql : 'sql'
                       SELECT SELECT * FROM || table_name
                       SELECT 'SELECT * FROM' * || table_name
           ���ڿ� ���տ��� : +�� �ƴ϶� || (java ������ +)
        
    ��¥?? : TO_DATE("��¥���ڿ�", "��¥ ���ڿ��� ���� ����")
            TO_DATE('20200417', 'YYYYMMDD')

WHERE : ����� ���ǿ� �����ϴ� �ุ ��ȸ�ǵ��� ����;
SELECT *
FROM users
WHERE userid = 'brown';



sal���� 1000���� ũ�ų� ����, 2000���� �۰ų� ���� ������ ��ȸ -> BETWEEN AND
�񱳴�� �÷� / �� BETWEEN ���۰� AND ���ᰪ
���۰��� ���ᰪ�� ��ġ�� �ٲٸ� ���� �������� ����

SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

SELECT *
FROM emp
WHERE sal >=1000
  AND sal <=2000;
  
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE(19820101,'YYYYMMDD') AND TO_DATE(19830101,'YYYYMMDD');

SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE(19820101,'YYYYMMDD') AND hiredate <= TO_DATE(19830101,'YYYYMMDD');

IN ������
�÷�:Ư���� IN (��1, ��2.....)
�÷��̳� Ư������ ��ȣ�ȿ� ���߿� �ϳ��� ��ġ�� �ϸ� TRUE

SELECT *
FROM emp
WHERE deptno = 10 OR deptno = 30;

SELECT USERID,USERNM,ALIAS
FROM users
WHERE userid in('brown', 'cony', 'sally');

���ڿ� ��Ī ���� : LIKE ���� / JAVA : startswith(prefix), endsWith(suffix)
����ŷ ���ڿ� : % - ��� ���ڿ�(���� ����)
              _ - � ���ڿ��̵��� �� �ϳ��� ����

���ڿ��� �Ϻΰ� ������ TRUE

�÷�|Ư���� LIKE ���� ���ڿ�

'cony' : cony�� ���ڿ�
'co%' : ���ڿ��� co�� �����ϰ� �ڿ��� � ���ڿ��̵� �� �� �ִ� ���ڿ�
        'cony', 'con', 'co'
'%co%' : co�� �����ϴ� ���ڿ�
        'cony', 'sally cony'
'co__' : co�� �����ϰ� �ڿ� �ΰ��� ���ڰ� ���� ���ڿ�
'_on_' : ��� �α��ڰ� on�̰� �� �ڷ� � ���ڿ� �̵���
         �ϳ��� ���ڰ� �� �� �ִ� ���ڿ�
 
 ���� �̸�(ename)�� �빮�� s�� �����ϴ� ������ ��ȸ;
 SELECT *
 FROM emp
 WHERE ename LIKE 'S%';
 
 --�ǽ�4
 SELECT MEM_ID, MEM_NAME
 FROM member
 WHERE mem_name LIKE '��%';
 
 --�ǽ�5
 SELECT MEM_ID, MEM_NAME
 FROM member
 WHERE mem_name LIKE '%��%';
 
 
 
 
 NULL ��
 SQL �񱳿����� :
 WHERE usernm = 'brown'
 
 MGR �÷� ���� ���� ��� ������ ��ȸ
 
 SELECT *
 FROM emp
 WHERE mgr IS NULL;
 
 ** SQL���� NULL ���� ���� ��� �Ϲ�����
 �񱳿�����(=)�� ��� ���ϰ�, IS �����ڸ� �̿� **
 
 ���� �ִ� ��Ȳ���� � �� : =, != , <>
 NULL : IS NULL , IS NOT NULL
 
 emp���̺��� mgr �÷� ���� NULL�� �ƴ� ������ ��ȸ
 SELECT *
 FROM emp
 WHERE mgr IS NOT NULL;
 
 
 --�ǽ� 6
 SELECT *
 FROM emp
 WHERE comm IS NOT NULL;
 
 
 
 
  
  SELECT *
  FROM emp
  WHERE mgr = 7698
  AND sal > 1000;
  
  SELECT *
  FROM emp
  WHERE mgr = 7698
  OR sal > 1000;
  
  SELECT *
  FROM emp
  WHERE mgr NOT IN (7698,7839);
==> WHERE mgr = 7698 OR mgr = 7839

SELECT *
  FROM emp
  WHERE mgr NOT IN (7698,7839);
==> WHERE (mgr != 7698 AND mgr != 7839)

--�ǽ�7
SELECT *
FROM emp
WHERE job = 'SALESMAN' AND hiredate>=TO_DATE('19810601','YYYYMMDD');

--�ǽ� 8
SELECT *
FROM emp
WHERE DEPTNO <>10 AND hiredate>=TO_DATE('1981061','YYYYMMDD');

--�ǽ� 9
SELECT *
FROM emp
WHERE DEPTNO NOT IN 10 AND hiredate>=TO_DATE('1981061','YYYYMMDD');

--�ǽ� 10
SELECT *
FROM emp
WHERE DEPTNO IN(20,30) AND hiredate>=TO_DATE('19810601','YYYYMMDD');

--�ǽ� 11
SELECT *
FROM emp
WHERE job = 'SALESMAN' OR hiredate>=TO_DATE('19810601','YYYYMMDD');

--�ǽ� 12
SELECT *
FROM emp
WHERE job = 'SALESMAN' OR EMPNO LIKE '78%';

--�ǽ� 13
SELECT *
FROM emp
WHERE job = 'SALESMAN' 
   OR EMPNO = 78
   OR EMPNO >= 780 AND EMPNO < 790
   OR EMPNO >=7800 AND EMPNO < 7900;

--�ǽ� 14

   
���� : {a, b, c} == {a, b, c}

table���� ��ȸ, ����� ������ ����(�������� ����)
==> ���нð��� ���հ� ������ ����

SQL������ �����͸� �����Ϸ��� ������ ������ �ʿ�
ORDER BY �÷��� [��������], �÷���2 [��������].....

������ ���� : ��������(DEFAULT) -ASC, �������� -DESC



���� �̸����� ���� ��������

SELECT *
FROM emp
ORDER BY ename ASC;

���� �̸����� ���� ��������

SELECT *
FROM emp
ORDER BY ename DESC;

-- job�� �������� ���� ���������ϰ� job�� ���� ��� �Ի����ڷ� �������� ����
SELECT *
FROM emp
ORDER BY job ASC, hiredate DESC;