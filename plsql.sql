CREATE OR REPLACE FUNCTION generate_horizontal_miniterms(predicates IN VARCHAR2) RETURN VARCHAR2 IS
    miniterms VARCHAR2(4000);
BEGIN
    SELECT LISTAGG(trim(regexp_substr(trim(regexp_substr(predicates, '[^AND]+', 1, level)), '[^=]+', 1, level)), ' ') WITHIN GROUP (ORDER BY NULL)
    INTO miniterms
    FROM dual
    CONNECT BY level <= REGEXP_COUNT(predicates, 'AND') + 1;

    RETURN miniterms;
END generate_horizontal_miniterms;
/
