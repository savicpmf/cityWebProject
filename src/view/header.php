<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projekat</title>
    <link rel='stylesheet' href="/378_Marko_Savic_Projekat/src/view/css/main.css">
    <script src="https://kit.fontawesome.com/37c6cb7999.js" crossorigin="anonymous"></script>
    <script src="/378_Marko_Savic_Projekat/script.js"></script>
</head>
    <body>
        <main>
            <div class="topnav ">
    
                <a class="active" href="/378_Marko_Savic_Projekat/index.php">Home</a>
                
                <?php
                
                session_start();
                if (isset($_SESSION['user'])) 
                {

                    $username=$_SESSION['user']['username'];

                    // Ako je korisnik ulogovan samo mu je potrebno Logout i Profile dugme

                    echo '<a href="/378_Marko_Savic_Projekat/src/view/Logout">Logout</a>';
                    echo "<a href='/378_Marko_Savic_Projekat/src/view/Profile'>$username</a>";
                } else 
                {
                    // A ako nije onda mu dajemo linkove za Login i Register
                    echo '<a href="/378_Marko_Savic_Projekat/src/view/register">Register</a>';
                    echo '<a href=/378_Marko_Savic_Projekat/src/view/Login.php>Login</a>';
                }
                ?>
            </div>
        <div class="flex-container">
    

    
 
       