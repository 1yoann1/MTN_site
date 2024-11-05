<?php
session_start();
// Désactiver l'affichage des erreurs
ini_set('display_errors', 0);
ini_set('display_startup_errors', 0);
error_reporting(0);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Connexion à la base de données
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "nom_de_la_base_de_donnees";
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Vérifier la connexion
    if ($conn->connect_error) {
        die("Échec de la connexion : " . $conn->connect_error);
    }

    // Récupérer l'ID de l'utilisateur
    if (isset($_POST['user_id'])) {
        $user_id = $_POST['user_id'];
    } else {
        die("ID utilisateur non fourni");
    }

    // Stocker les résultats pour affichage
    $_SESSION['results'] = [];

    // Boucle pour récupérer et stocker les réponses des utilisateurs
    foreach ($_POST as $key => $user_answer) {
        if (strpos($key, 'question') === 0) {
            $question_id = str_replace('question', '', $key);
            $user_answer = $conn->real_escape_string($user_answer);

            // Utilisation de déclarations préparées pour éviter les injections SQL
            $stmt = $conn->prepare("INSERT INTO reponses (user_id, question_id, user_answer, date) VALUES (?, ?, ?, NOW())");
            $stmt->bind_param("iis", $user_id, $question_id, $user_answer);
            if (!$stmt->execute()) {
                echo "Erreur : " . $stmt->error;
            }
            $stmt->close();

            // Vérifier si la réponse est correcte
            $sql_correct = "SELECT answer FROM questions WHERE id = ?";
            $stmt = $conn->prepare($sql_correct);
            $stmt->bind_param("i", $question_id);
            $stmt->execute();
            $result = $stmt->get_result();
            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $correct_answer = $row['answer'];
                $_SESSION['results'][$question_id] = [
                    'user_answer' => $user_answer,
                    'correct_answer' => $correct_answer,
                    'is_correct' => ($user_answer == $correct_answer)
                ];
            }
            $stmt->close();
        }
    }

    $conn->close();
    // Redirection vers page_suivante.php pour afficher les résultats
    header("Location: thank_you.php");
    exit();
}
?>
