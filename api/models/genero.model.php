<?php

class GeneroModel {

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=peliculas; charset=utf8', 'root', '');
    }

    public function getAll() {

        $query = $this->db->prepare('SELECT * FROM `genero` ORDER BY nombre ASC');
        $query->execute();         
        $genero = $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de objetos
        
        return $genero;
    }

    public function get($id){
        $query = $this->db->prepare("SELECT * FROM genero WHERE id_genero = ?");
        $query->execute([$id]);
        $genero = $query->fetch(PDO::FETCH_OBJ);

        return $genero;
    }
    
    /*Inserta un genero en la base de datos*/
    function insertGenero($nombre, $genre, $id_genero, $fecha, $duracion){
        $query = $this->db->prepare("INSERT INTO genero (nombre, genre, id_genero, fecha, duracion) VALUES (?, ?, ?, ?, ?)");
        $query->execute([$nombre, $genre, $id_genero, $fecha, $duracion]);      

        return $this->db->lastInsertId();
    }

    public function editGenero($nombre, $genre, $id_genero, $fecha, $duracion) {
        $editargenero = $this->db->prepare("UPDATE genero SET nombre = ?, genre = ?, fecha = ?, duracion = ? WHERE id_genero=?");
        $editargenero->execute([$nombre, $genre, $id_genero, $fecha, $duracion]); //nombre-de-la-columna = valor[, nombre-de-la-columna=valor]
        return $editargenero;
    }

    /*Elimina un genero dado su id*/
    function delete($id_genero) {//consulta desde SQL -> DELETE FROM `products` WHERE `products`.`id_product` = 22;
        $query = $this->db->prepare('DELETE FROM genero WHERE id_genero = ?');
        $query->execute([$id_genero]);
    }

}
