--실습 1 99
SELECT DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL 
FROM EMP E NATURAL JOIN DEPT D 
WHERE SAL > 2000;
--실습 1 92
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO 
 AND SAL > 2000;
 
--실습 2 99
SELECT DEPTNO, D.DNAME,
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*)
  FROM EMP E NATURAL JOIN DEPT D 
  GROUP BY DEPTNO, D.DNAME;
--실습 2 92
SELECT D.DEPTNO, D.DNAME,
       TRUNC(AVG(E.SAL)) AS AVG_SAL,
       MAX(E.SAL) AS MAX_SAL,
       MIN(E.SAL) AS MIN_SAL,
       COUNT(*)
  FROM EMP E, DEPT D
 WHERE E.DEPTNO = D.DEPTNO
 GROUP BY D.DEPTNO, D.DNAME;

--실습 3 99
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
  FROM EMP E RIGHT OUTER JOIN DEPT D ON (D.DEPTNO = E.DEPTNO)
ORDER BY DEPTNO, D.DNAME;
--실습 3 92
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
ORDER BY DEPTNO, D.DNAME;

--실습 4 99
SELECT D.DEPTNO, D.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL,
        E1.DEPTNO AS DEPTNO_1,
        S.LOSAL, S.HISAL, S.GRADE,
        E1.MGR AS MGR_EMPNO, 
        E1.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN DEPT D ON(E1.DEPTNO = D.DEPTNO)
         LEFT OUTER JOIN EMP E2 ON(E1.MGR = E2.EMPNO)
         LEFT OUTER JOIN SALGRADE S ON (E1.SAL BETWEEN S.LOSAL AND S.HISAL)
ORDER BY D.DEPTNO, E1.EMPNO;
--실습 4 92
SELECT D.DEPTNO, D.DNAME, E1.EMPNO, E1.ENAME, E1.MGR, E1.SAL,
        E1.DEPTNO AS DEPTNO_1,
        S.LOSAL, S.HISAL, S.GRADE,
        E1.MGR AS MGR_EMPNO, 
        E1.ENAME AS MGR_ENAME
FROM EMP E1, DEPT D, EMP E2, SALGRADE S 
WHERE E1.DEPTNO(+) = D.DEPTNO
  AND E1.MGR = E2. EMPNO(+)
  AND E1.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
ORDER BY D.DEPTNO, E1.EMPNO;
