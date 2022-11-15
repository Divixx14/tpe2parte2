<?php

require_once './api/models/genero.model.php';
require_once './api/views/api.view.php';

class ApiGeneroController {
    private $model;
    private $view;

    private $data;

    public function __construct() {
        $this->model = new GeneroModel();
        $this->view = new ApiView();

        // lee el body del request
        $this->data = file_get_contents("php://input");

    }

    private function getData() {
        return json_decode($this->data);
    }
    
    function getAll($params = null){
        $genero = $this->model->getAll();
        $this->view->response($genero, 200);
    }

    public function get($params = null) {
        //obtengo el id del arreglo de params
        $id = $params[':ID'];//si hubieramos utilizado más parametros en el ruter: 
        //$parametro1 = $params[':PARAMETRO1'];
        $genero = $this->model->get($id);

        if ($genero){
            $this->view->response($genero);
        }
        else{//si no existe devuelvo código de error 404
            $this->view->response("La pelicula con el id: $id no existe", 404);
        }
    }

    public function insertGenero($params = null){
        $genero = $this->getData();

        if (empty($genero->nombre) || empty($genero->genre) || empty($genero->id_genero) || empty($genero->fecha) || empty($genero->duracion)){ 
            $this->view->response("Complete los campos obligatorios", 400);
        }
        else{
            $id = $this->model->insertGenero($genero->nombre, $genero->genre, $genero->id_genero, $genero->fecha, $genero->duracion);
            $genero = $this->model->get($id);
            $this->view->response("Se ingreso completamente", 201);
        }
    }

    public function delete($params = null){
        $id = $params[':ID'];
        $genero = $this->model->get($id);
    if ($genero){
        $this->model->delete($id);
        $this->view->response($genero);
    }
    else{
        $this->view->response("La pelicula con el id:" . $id . " no existe", 404);
    }

    }

    public function editPelicula($params = []){
        $id_genero = $params[':ID'];
        $genero = $this->model->get($id_genero);

        if($genero){
            $body = $this->getData();
            $nombre = $body->nombre;
            $genre = $body->genre;
            $id_genero = $body->id_genero;
            $fecha = $body->fecha;
            $duracion = $body->duracion;
            $genero = $this->model->editGenero($nombre, $genre, $id_genero, $fecha, $duracion);
            $this->view->response("Pelicula con el id= $id_genero actualizada con éxito", 200);
        }
        else{
            $this->view->response("Pelicula con el id= $id_genero No encontrada", 404);
        }
    }
}
