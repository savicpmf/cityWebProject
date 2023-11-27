<?php 
include('Database.php');

$database = new Database("mysql:host=localhost;dbname=gradovi","root",'');
$database->connect();
$conn= $database->getDb();

?>