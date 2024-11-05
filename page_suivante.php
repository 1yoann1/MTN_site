<?php
session_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QUESTIONS ALÉATOIRES</title>
    <link rel="stylesheet" href="file.css">
    <style>
        body {
            background-image: url('images/background2.jpg'); /* Changez l'image selon votre choix */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            box-sizing: border-box;
            overflow: hidden;
        }
        .container {
            padding: 20px;
            display: flex;
            flex-direction: column; /* Arrange items vertically */
            align-items: center; /* Align items to the center */
            margin-top: 60px; /* Ajuste la marge du haut */
            height: 80vh;
            overflow-y: auto;
        }
        h1 {
            text-align: left; /* Décale à gauche */
            margin-left: 1060px;
            color: yellow;
            text-shadow: 2px 2px 4px #000000; /* Sérifs noirs */
            text-transform: uppercase; /* Met en majuscules */
            font-family: 'Times New Roman', serif; /* Police avec sérif */
            width: 100%;
            position: fixed;
            top: 20px;
        }
        .question-container {
            margin-bottom: 0px;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 10px; /* Ajustez le padding pour une meilleure lisibilité */
            border-radius: 5px;
            width: 100%; /* Largeur des cadres */
            height: auto; /* Longueur des cadres */
            box-sizing: border-box;
        }
        .question-container h2 {
            margin-bottom: 10px;
            color: #333;
        }
        .question-container ul {
            list-style-type: none;
            padding: 0;
        }
        .question-container li {
            margin-bottom: 5px; /* Réduisez l'espacement entre les options */
        }
        .correct {
            color: green;
        }
        .incorrect {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Questions :</h1>
        <form action="submit_answers.php" method="POST">
        <?php
        // Connexion à la base de données
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "nom_de_la_base_de_donnees";

        // Créer une connexion
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Vérifier la connexion
        if ($conn->connect_error) {
            die("Échec de la connexion : " . $conn->connect_error);
        }

        // ID utilisateur depuis la session
        if (isset($_SESSION['user_id'])) {
            $user_id = $_SESSION['user_id'];
        } else {
            die("Utilisateur non connecté");
        }
        echo '<input type="hidden" name="user_id" value="' . $user_id . '">';

        // Récupérer des questions aléatoires
        $sql = "SELECT * FROM questions ORDER BY RAND() LIMIT 3"; // On garde la commande originale pour être sûr
        $result = $conn->query($sql);

        if (!$result) {
            die("Erreur de la requête SQL : " . $conn->error);
        }

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo '<div class="question-container">';
                echo '<h2>' . $row['question_no'] . '. ' . $row['question'] . '</h2>';
                echo '<ul>';
                echo '<li><label><input type="radio" name="question' . $row['id'] . '" value="' . $row['opt1'] . '"> ' . $row['opt1'] . '</label></li>';
                echo '<li><label><input type="radio" name="question' . $row['id'] . '" value="' . $row['opt2'] . '"> ' . $row['opt2'] . '</label></li>';
                echo '<li><label><input type="radio" name="question' . $row['id'] . '" value="' . $row['opt3'] . '"> ' . $row['opt3'] . '</label></li>'; // Ajout de la troisième option
                echo '</ul>';
                echo '</div>';
            }
        } else {
            echo "Aucune question trouvée.";
        }
        $conn->close();
        ?>
        <input type="submit" value="Soumettre">
        </form>
    </div>
</body>
</html>

