---------------------------------------------------------------------------------------------------
--	CTE CORRELATIVO
---------------------------------------------------------------------------------------------------

  WITH R1(col1)
     AS (SELECT 'ELEMENTO 1 TBL 1'  as MICOL
       UNION ALL
       SELECT 'ELEMENTO 2 TBL 1'
    ),
     R2 (col2)
     AS (SELECT CONCAT(col1,' R2') FROM R1),
     R3 (col3)
     AS (SELECT 'Elemento 3'),
     R4 (col4)
     AS (SELECT 'Elemento 4')
     SELECT *
     FROM R1
          CROSS JOIN R2
          CROSS JOIN R3
          CROSS JOIN R4;