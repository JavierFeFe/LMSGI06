for $nota in db:open("curso")/curso/notas/nota[@alum="n43483437"]
let $nombre := db:open("curso")/curso/alumnos/alumno[@cod = $nota/@alum]/apenom
let $asignatura := db:open("curso")/curso/asignaturas/asignatura[@cod = $nota/@asig]/nombre
let $calificacion := $nota/calificacion
return data($nombre) || ": " || data($asignatura) || " - " || $calificacion
