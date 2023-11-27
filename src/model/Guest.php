<?php

namespace src\Model;

class Guest 
{
    public function selectCityByName($db, $cityName) // vraca sve gradove sa tim imenom
    {
        $query = 'SELECT * FROM city 
                  WHERE Name = :cityName 
                  ORDER BY Population DESC';
        $statement = $db->prepare($query);
        $statement->bindValue(':cityName', $cityName);
        $statement->execute();
        $results = $statement->fetchAll();
        $statement->closeCursor();
        return $results;
    }

}