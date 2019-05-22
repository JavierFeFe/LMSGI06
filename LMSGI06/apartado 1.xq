for $alum in db:open("curso")/curso/alumnos/alumno
let $cod := $alum/@cod
let $nombre := $alum/apenom
let $nota := db:open("curso")/curso/notas/nota[@alum=$cod]/calificacion
return if ($nota != "") then data($nombre)
