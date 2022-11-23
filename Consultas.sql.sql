Consulta # 1

/* Mostrar el histórico de clientes que se han registrado por cada 
año. Debe aparecer en una columna el año, en otra columna la 
cantidad de registrados en ese año, en otra columna el tipo de 
membresía
*/

SELECT 
 extract (YEAR from cliente.FECHA_REGISTRO_CLIENTE) AS AÑO_DE_REGISTRO, 
COUNT(*) AS CANTIDAD_DE_CLIENTES_REGISTRADOS, 
membresia.TIPO_MEMBRESIA AS TIPO_DE_MEMBRESIA 
FROM cliente
INNER JOIN membresia ON cliente.COD_MEMBRESIA = membresia.COD_MEMBRESIA 
GROUP BY (cliente.FECHA_REGISTRO_CLIENTE) , cliente.COD_MEMBRESIA,membresia.TIPO_MEMBRESIA;


/*   
Consulta # 2	                         
Mostrar el histórico de cuántos clientes existen inscritos en 
cada membresía. Debe aparecer en una columna el tipo de membresía 
y en otra columna la cantidad de usuarios inscritos en la misma
*/

SELECT 
membresia.TIPO_MEMBRESIA AS TIPO_MEMBRESIAS, 
COUNT(cliente.COD_MEMBRESIA) AS CANTIDAD_DE_CLIENTES_INSCRITOS 
FROM cliente 
INNER JOIN membresia
ON cliente.COD_MEMBRESIA = membresia.COD_MEMBRESIA 
GROUP BY cliente.COD_MEMBRESIA,membresia.TIPO_MEMBRESIA 
ORDER BY (cliente.COD_MEMBRESIA,membresia.TIPO_MEMBRESIA) ASC;
/*   
Consulta # 3	                         
Mostrar el histórico de cuántos empleados fueron contratados por 
cada año. Debe aparecer en una columna el año y en otra columna 
la cantidad de empleados contratados
membresía
*/

SELECT 
extract (YEAR from empleado.FECHA_INGRESO_EMP) AS AÑO_DE_CONTRATOS, 
COUNT(*) AS CANTIDAD_DE_EMPLEADOS_CONTRATADOS, rol.ROL 
FROM empleado 
INNER JOIN rol 
ON empleado.ROL_COD = rol.ROL_COD 
GROUP BY (empleado.FECHA_INGRESO_EMP) , empleado.ROL_COD,rol.ROL;
/*   
Consulta # 4	                         
Mostrar el histórico de cuántos empleados existen por área. Debe 
aparecer en una columna la cantidad de empleados y en otra 
columna el cargo
*/

SELECT 
rol.ROL AS CARGO, COUNT(*) AS CANTIDAD_DE_EMPLEADOS_DESIGNADOS 
FROM empleado 
INNER JOIN rol 
ON empleado.ROL_COD = rol.ROL_COD 
GROUP BY rol.ROL,empleado.ROL_COD ORDER BY COUNT(*) ASC;
