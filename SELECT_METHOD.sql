SELECT * FROM t_student;

SELECT nm, substr(nm,2,2)
from t_student;

SELECT nm, instr(nm,'하')
FROM t_student;

SELECT trim('    a  ') from dual;

SELECT 1+1 FROM DUAL;

SELECT concat('a','b') FROM DUAL;
SELECT concat(concat('a','b'),'c') FROM DUAL;

