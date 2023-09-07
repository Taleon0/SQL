declare @texto nvarchar(max) = 'texto de prueba wiiiiiiiiiiiii'
;
with Serie(n) as (
    select 0
    
        union ALL
    
    select n+1
    from Serie where n<len(@texto)-1
)
select substring(@texto,n+1,1) as caracter
    from Serie
    option (maxrecursion 0) -- Define cual es la cantidad maxima de iteraciones, default = 100, 0 = no limits