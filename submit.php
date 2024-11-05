<?php
session_start();

// Connexion à la base de données (ajuste les paramètres de connexion)
$servername = "localhost";
$username = "root"; // Par défaut pour MAMP
$password = "root"; // Par défaut pour MAMP
$dbname = "nom_de_la_base_de_donnees"; // Remplace par le nom de ta base de données

// Créer une connexion
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

// Récupérer les données du formulaire
$nom = $_POST['nom'];
$prenom = $_POST['prenom'];
$email = $_POST['email'];
$telephone = $_POST['telephone'];

// Utilisation de déclarations préparées pour éviter les injections SQL
$stmt = $conn->prepare("INSERT INTO utilisateurs (nom, prenom, email, telephone, date) VALUES (?, ?, ?, ?, NOW())");
$stmt->bind_param("ssss", $nom, $prenom, $email, $telephone);

if ($stmt->execute()) {
    $user_id = $stmt->insert_id; // Récupérer l'ID généré pour l'utilisateur
    $_SESSION['user_id'] = $user_id; // Stocker l'ID de l'utilisateur dans la session
    echo "<script>alert('Vous vous êtes bien connecté! Vos informations ont été envoyées avec succès.');</script>";
    header("Refresh:0; url=page_suivante.php");
    exit();
} else {
    echo "Erreur : " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
