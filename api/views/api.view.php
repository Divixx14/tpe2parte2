<?php

class ApiView {
    
    public function response($data, $code = 200) {//parámetro con valores por defecto. Dice: si se llama a la función sin el parámetro $code, ponele un 200
        header("Content-Type: application/json");
        header("HTTP/1.1 " . $code . " " . $this->requestStatus($code));
        
        //convierto los datos a json
        echo json_encode($data);
    }

    private function requestStatus($code){//devuelve el texto asociado a un código de respuesta
        $status = array(//arreglo asociativo para no escribir tantos if, es como hacer un case
            200 => "OK",
            201 => "Created",
            400 => "Bad Request",
            404 => "Not Found",
            500 => "Internal Server Error"
        );
        return (isset($status[$code])) ? $status[$code] : $status[500];
    }
}