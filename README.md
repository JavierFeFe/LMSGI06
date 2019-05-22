# LMSGI06
Xerar un esquema XSD que sirva para describir en XML a devanita base de datos relacional. Crear o documento XML correspondente á base de datos.
```XSD
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="curso">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="alumnos">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="alumno" maxOccurs="unbounded">
								<xs:complexType>
									<xs:sequence>
										<xs:element name="apenom" type="xs:string"/>
										<xs:element name="direc" type="xs:string"/>
										<xs:element name="pobla" type="xs:string"/>
										<xs:element name="telef" type="xs:string"/>
									</xs:sequence>
									<xs:attribute name="cod" use="required">
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:pattern value="n\d{8}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
								</xs:complexType>								
							</xs:element>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name="asignaturas">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="asignatura" maxOccurs="unbounded">
								<xs:complexType>
									<xs:sequence>
										<xs:element name="nombre" type="xs:string"/>
									</xs:sequence>
									<xs:attribute name="cod" use="required">
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:pattern value="a\d{1,2}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name="notas">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="nota" maxOccurs="unbounded">
								<xs:complexType>
									<xs:sequence>
										<xs:element name="calificacion" type="xs:float"/>
									</xs:sequence>
									<xs:attribute name="alum" type='xs:token' use="required"/>
									<xs:attribute name="asig" type="xs:token" use="required"/>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
		<xs:key name='alumnoID'>  
			<xs:selector xpath='alumnos/alumno'/>  
			<xs:field xpath='@cod'/>
		</xs:key>  
		<xs:keyref name='alumnoIDRef' refer='alumnoID'>  
			<xs:selector xpath='notas/nota'/>  
			<xs:field xpath='@alum'/>
		</xs:keyref>
		<xs:key name='asignaturaID'>  
			<xs:selector xpath='asignaturas/asignatura'/>  
			<xs:field xpath='@cod'/>
		</xs:key>  
		<xs:keyref name='asignaturaIDRef' refer='asignaturaID'>  
			<xs:selector xpath='notas/nota'/>  
			<xs:field xpath='@asig'/>
		</xs:keyref> 
	</xs:element>
</xs:schema>
```
  
```XML
<?xml version="1.0" encoding="utf-8"?>
<curso xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:noNamespaceSchemaLocation="curso.xsd">
	<!-- Tabla alumnos -->
	<alumnos>
		<alumno cod ="n12344345">
			<apenom>Alcalde García, Luis</apenom>
			<direc>Las Manos, 24</direc>
			<pobla>Lamadrid</pobla>
			<telef>942756645</telef>
		</alumno>
		<alumno cod ="n43483437">
			<apenom>González Pérez, Olga</apenom>
			<direc>Miraflor 28 - 3A</direc>
			<pobla>Torres</pobla>
			<telef>942564355</telef>
		</alumno>
		<alumno cod ="n88234942">
			<apenom>Fernández Díaz, María</apenom>
			<direc>Luisa Fernanda 53</direc>
			<pobla>Miera</pobla>
			<telef>942346945</telef>
		</alumno>
	</alumnos>
	<!-- Tabla asignaturas -->
	<asignaturas>
		<asignatura cod ="a1">
			<nombre>FH</nombre>
		</asignatura>
		<asignatura cod ="a2">
			<nombre>FOL</nombre>
		</asignatura>
		<asignatura cod ="a3">
			<nombre>ISO</nombre>
		</asignatura>
		<asignatura cod ="a4">
			<nombre>LMSGI</nombre>
		</asignatura>
		<asignatura cod ="a5">
			<nombre>PAR</nombre>
		</asignatura>
		<asignatura cod ="a6">
			<nombre>GBD</nombre>
		</asignatura>
	</asignaturas>
	<!-- Tabla notas -->
	<notas>
		<nota alum="n12344345" asig="a1">
			<calificacion>4.0</calificacion>
		</nota>
		<nota alum="n12344345" asig="a2">
			<calificacion>10.0</calificacion>
		</nota>
		<nota alum="n12344345" asig="a3">
			<calificacion>3.0</calificacion>
		</nota>
		<nota alum="n12344345" asig="a4">
			<calificacion>8.0</calificacion>
		</nota>
		<nota alum="n12344345" asig="a5">
			<calificacion>6.0</calificacion>
		</nota>
		<nota alum="n12344345" asig="a6">
			<calificacion>9.0</calificacion>
		</nota>
		<nota alum="n43483437" asig="a1">
			<calificacion>5.0</calificacion>
		</nota>
		<nota alum="n43483437" asig="a2">
			<calificacion>7.0</calificacion>
		</nota>
		<nota alum="n43483437" asig="a4">
			<calificacion>4.0</calificacion>
		</nota>
		<nota alum="n88234942" asig="a1">
			<calificacion>8.0</calificacion>
		</nota>
		<nota alum="n88234942" asig="a2">
			<calificacion>6.0</calificacion>
		</nota>
		<nota alum="n88234942" asig="a3">
			<calificacion>6.0</calificacion>
		</nota>
	</notas>
</curso>
```
Logo de realizar estes documentos, fecer as seguintes consultas XQuery sobre os datos:

Obter o nome de todos os alumnos matriculados nalgún módulo.
```XQUERY
for $alum in db:open("curso")/curso/alumnos/alumno
let $cod := $alum/@cod
let $nombre := $alum/apenom
let $nota := db:open("curso")/curso/notas/nota[@alum=$cod]/calificacion
return if ($nota != "") then data($nombre)
```
Obter as cualificacións do alumno de código "n43483437" en cada módulo.
```XQUERY
for $nota in db:open("curso")/curso/notas/nota[@alum="n43483437"]
let $nombre := db:open("curso")/curso/alumnos/alumno[@cod = $nota/@alum]/apenom
let $asignatura := db:open("curso")/curso/asignaturas/asignatura[@cod = $nota/@asig]/nombre
let $calificacion := $nota/calificacion
return data($nombre) || ": " || data($asignatura) || " - " || $calificacion
```
Obter o nome e o teléfono de cada alumno ordenado por apelidos de forma descendente.
```XQUERY
for $alum in db:open("curso")/curso/alumnos/alumno order by $alum/apenom
let $nombre := $alum/apenom
let $telef := $alum/telef
return data($nombre) || " - " || data($telef)
```
Cantos módulos hai?
```XQUERY
let $total := count(db:open("curso")/curso/asignaturas/asignatura)
return $total
```
Obter os nomes dos alumnos matriculados en LMSGI e as súas notas. ordenado por notas.
```XQUERY
let $cod := data(db:open("curso")/curso/asignaturas/asignatura[nombre="LMSGI"]/@cod)
for $nota in db:open("curso")/curso/notas/nota[@asig=$cod] order by $nota/calificacion
let $cal := data($nota/calificacion)
let $nombre := db:open("curso")/curso/alumnos/alumno[@cod=$nota/@alum]/apenom
return $nombre || " - " || $cal
```
Obter os nomes e as cualificacións dos matriculados en FH que aprobaron.
```XQUERY
let $cod := data(db:open("curso")/curso/asignaturas/asignatura[nombre="FH"]/@cod)
for $nota in db:open("curso")/curso/notas/nota[@asig=$cod] order by $nota/calificacion
let $cal := data($nota/calificacion)
let $nombre := db:open("curso")/curso/alumnos/alumno[@cod=$nota/@alum]/apenom
return if ($cal >= 5.0) then $nombre || " - " || $cal
```
