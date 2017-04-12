CREATE OR REPLACE PACKAGE prueba AS 
PROCEDURE prueba1 (p_empno  IN  emp.empno%TYPE DEFAULT NULL);
END prueba;
SHOW ERRORS;

CREATE OR REPLACE PACKAGE BODY prueba AS
PROCEDURE prueba1 (p_empno  IN  emp.empno%TYPE DEFAULT NULL) IS
v_emp emp%rowtype;


  --Creamos un cursor
  BEGIN
  
  SELECT * 
  INTO v_emp
  FROM emp
  WHERE empno = p_empno;
  
  
  OWA_UTIL.Mime_Header('text/xml');
  HTP.Print(
  '<?xml version="1.0"?>'
  || '<EMP>'
  || ' <EMPNO>'||v_emp.empno||'</EMPNO>'
  || ' <ENAME>'||v_emp.ename||'</ENAME>'
  || ' <DEPTNO>'||v_emp.deptno||'</DEPTNO>'
  || ' <SAL>'||v_emp.sal||'</SAL>'
  || '</EMP>');
  EXCEPTION
  WHEN OTHERS THEN
  --OWA_UTIL.Mime_Header('text/xml');
  HTP.Print(
  '<?xml version="1.0"?>'
  || '<ROWSET>'
  || ' <ERROR>'||to_char(SQLERRM)||'</ERROR>'
  || '</ROWSET>');
  

  END prueba1;

END prueba;
SHOW ERRORS;

