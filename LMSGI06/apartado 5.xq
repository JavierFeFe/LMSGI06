let $cod := data(db:open("curso")/curso/asignaturas/asignatura[nombre="LMSGI"]/@cod)
for $nota in db:open("curso")/curso/notas/nota[@asig=$cod] order by $nota/calificacion
let $cal := data($nota/calificacion)
let $nombre := db:open("curso")/curso/alumnos/alumno[@cod=$nota/@alum]/apenom
return $nombre || " - " || $cal