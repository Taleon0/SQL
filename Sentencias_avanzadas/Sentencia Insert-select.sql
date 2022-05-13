-- Insertar los registros de una tabla dentro de otra 
-- ya creada

-- Revisamos la data en la tabla person, esquema person
select * from Person.Person

--Creamos la tabla a donde vamos a copiar la info
create table person_copy (
	Firstname varchar(50),
	Lastname varchar(50)
	)

-- insertamos la informacion que queremos en la tabla 
-- recién creada

insert into person_copy
select [FirstName],[LastName] from Person.Person
where person.PersonType='EM'

-- revisamos la informacion obtenida
select * from person_copy