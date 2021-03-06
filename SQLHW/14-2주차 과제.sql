CREATE TABLE CHAP10HW_EMP AS SELECT * FROM EMP;
CREATE TABLE CHAP10HW_DEPT AS SELECT * FROM DEPT;
CREATE TABLE CHAP10HW_SALGRADE AS SELECT * FROM SALGRADE;

--실습 1
INSERT ALL
INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
            VALUES(50, 'ORACLE', 'BUSAN')
INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
            VALUES(60, 'SQL', 'ILSAN')
INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
            VALUES(70, 'SELECT', 'INCHEON')
INTO CHAP10HW_DEPT(DEPTNO, DNAME, LOC)
            VALUES(80, 'DML', 'BUNDANG')
SELECT *FROM DUAL;

SELECT * FROM CHAP10HW_DEPT;

--실습2
INSERT ALL
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, TO_DATE('2016-01-02', 'YYYY-MM-DD'),4500, NULL, 50)
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7202, 'TEST_USER2', 'CLERK', 7201, TO_DATE('2016-02-21', 'YYYY-MM-DD'),1800, NULL, 50)
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, TO_DATE('2016-04-11', 'YYYY-MM-DD'),3400, NULL, 60)            
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, TO_DATE('2016-05-31', 'YYYY-MM-DD'),2700, 300, 60)
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7205, 'TEST_USER5', 'CLERK', 7201, TO_DATE('2016-07-20', 'YYYY-MM-DD'),2600, NULL, 70)
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7206, 'TEST_USER6', 'CLERK', 7201, TO_DATE('2016-09-08', 'YYYY-MM-DD'),2600, NULL, 70)    
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, TO_DATE('2016-10-28', 'YYYY-MM-DD'),2600, NULL, 80)
INTO CHAP10HW_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
            VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, TO_DATE('2018-03-09', 'YYYY-MM-DD'),2300, NULL, 80)              
SELECT *FROM DUAL;

SELECT * FROM CHAP10HW_EMP;

--실습 3
UPDATE CHAP10HW_EMP
   SET DEPTNO =70
 WHERE SAL > (SELECT AVG(SAL)
                FROM CHAP10HW_EMP
               WHERE DEPTNO = 50);

SELECT * FROM CHAP10HW_EMP;   

--실습 4
UPDATE CHAP10HW_EMP
SET SAL = SAL*1.1,
    DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE)
                    FROM CHAP10HW_EMP
                    WHERE DEPTNO = 60);
 
SELECT * FROM CHAP10HW_EMP;           

--실습 5
DELETE CHAP10HW_EMP
WHERE EMPNO IN (SELECT E.EMPNO
                FROM CHAP10HW_EMP E, CHAP10HW_SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
                AND S.GRADE = 5);
SELECT * FROM CHAP10HW_EMP;           