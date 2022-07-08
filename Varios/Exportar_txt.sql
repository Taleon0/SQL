--The first thing you have to do is make sure xp_cmdshell is enabled. You can do this in one of two ways.

EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE 

--Here is a sample command that will export the results
EXEC xp_cmdshell 'bcp "SELECT TOP 10 * FROM SSIS..FIFA" queryout "T:\GITHUB\Git-SQL\Varios\test_exportar_txt.txt" -T -c -t"|"' 

--Here we have the headers 
EXEC xp_cmdshell 'bcp "SELECT ''ID'',''Nombre'',''Liga'',''ValorEuropa'' UNION ALL SELECT TOP 10 cast(ID as varchar(10)),Nombre,Liga,cast(cast(ValorEuropa as numeric(20,4)) as varchar(50)) FROM SSIS..FIFA" queryout "T:\GITHUB\Git-SQL\Varios\test_exportar_txt_headers.txt" -T -c -t"|"' 
