<?php

if(isset($_SESSION['user']))
{
    $userLevel=$_SESSION['user']['userLevel'];
}
else
{
    $userLevel='guest';
}


if ($results) 
{
    echo "<div class='flex-container'>";
    foreach ($results as $result) 
    {
        $id = $result['ID'];
        $city = $result['Name'];
        $countrycode = $result['CountryCode'];
        $district = $result['District'];
        $population = $result['Population'];
        ?>

            <form action="index.php" method="POST">
            <input type="hidden" name="id" value="<?= $id ?>">
            <label for="city-<?= $id ?>">City Name:</label>
            <input type="text" id="cityName-<?= $id ?>" name="cityName" value="<?= $city ?>" <?= ($userLevel === 'guest' ? 'disabled' : '') ?> required>
            <label for="countrycode-<?= $id ?>">Country Code:</label>
            <input type="text" id="countrycode-<?= $id ?>" name="countrycode" maxlength="3" value="<?= $countrycode ?>" <?= ($userLevel === 'guest' ? 'disabled' : '') ?> required>
            <label for="district-<?= $id ?>">District:</label>
            <input type="text" id="district-<?= $id ?>" name="district" value="<?= $district ?>" <?= ($userLevel === 'guest' ? 'disabled' : '') ?>>
            <label for="population-<?= $id ?>">Population:</label>
            <input type="number" min="0" id="population-<?= $id ?>" name="population" value="<?= $population ?>" <?= ($userLevel === 'guest' ? 'disabled' : '') ?>>
             
            <?php if ($userLevel === 'manager' || $userLevel === 'admin' || $userLevel === 'user') { ?>
                <button type="submit" id="button1" name="action" value="insert">Insert</button>
            <?php } ?>
            
            <?php if ($userLevel === 'manager' || $userLevel === 'admin') { ?>
                <button type="submit" id="button2" name="action" value="update">Update</button>
            <?php } ?>
            
            <?php if ($userLevel === 'admin') { ?>
                <button type="submit" id="button3" name="action" value="delete">Delete</button>
            <?php } ?>
        </form>
        <?php
    }
} 
else 
{
    echo "<div class='flex-container'><h1 class='marginTop'>Sorry, no results.</h1></div><br>";
}
echo "</div>";
?>
