API REST FULL
Importar la base de datos
importar desde PHPMyAdmin (o cualquiera) database/peliculas.sql
ENDPOINTS

GET ALL
URL: http://localhost/Tpe2-WebII-Fran/api/genero method: GET

GET BY ID
URL: http://localhost/Tpe2-WebII-Fran/api/genero:ID method: GET

DELETE BY ID
URL: http://localhost/Tpe2-WebII-Fran/api/genero:ID method: DELETE

POST
URL: http://localhost/Tpe2-WebII-Fran/api/genero method: POST
Body {"nombre": "","genre": "","id_genero": "", "fecha: "", "duracion": ""}

EDIT BY ID
URL: http://localhost/Tpe2-WebII-Fran/api/genero method: PUT
Body {"nombre": "","genre": "","id_genero": "", "fecha: "", "duracion": ""}
