--Cursor que muestre por cada empleado de cada año, su código de empleado, la cantidad de clientes --
--asignado de ser necesario, el cargo que ejerce y la fecha de ingreso a la empresa--
do $$
declare 
	registro Record;
	registro2 Record;
	asignados Record;
	Cur_consul Cursor for select * from "empleado" Order by "cod_empleado" asc;
	Cur_consul2 Cursor for select "cod_empleado" from "entrenador" group by "cod_empleado";
	Cur_asign Cursor for select count("cod_empleado") FROM "entrenador" group by "cod_empleado";
begin
Open Cur_consul;
Fetch Cur_consul into registro;
Raise notice 'DATOS DE LOS EMPLEADOS';
While (FOUND) loop
Raise notice 'Código de empleado: %  ,  Rol: %  ,  Fecha de ingreso: %', registro.cod_empleado , registro.rol_cod , 
registro.fecha_ingreso_emp;
Fetch Cur_consul into registro;
end loop;

Raise notice '';

Open Cur_consul2;
Open Cur_asign;
Fetch Cur_consul2 into registro2;
Fetch Cur_asign into asignados;
Raise notice 'EMPLEADOS Y CANTIDAD DE CLIENTES ASIGNADOS';
While (FOUND) loop
Raise notice 'Código de empleado: %  , Asignados: %', registro2.cod_empleado , asignados;
Fetch Cur_consul2 into registro2;
Fetch Cur_asign into asignados;
end loop;
end $$
Language 'plpgsql';
