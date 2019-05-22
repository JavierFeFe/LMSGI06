for $alum in db:open("curso")/curso/alumnos/alumno order by $alum/apenom
let $nombre := $alum/apenom
let $telef := $alum/telef
return data($nombre) || " - " || data($telef)