<?php
session_start();
include "conexao.php";
$erro = "";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $login = trim($_POST["login"] ?? "");
    $senha = $_POST["senha"] ?? "";
    $sql = "SELECT id, nome, senha_hash
FROM usuarios
WHERE login = ?";
    $stmt = $conexao->prepare($sql);
    $stmt->bind_param("s", $login);
    $stmt->execute();
    $resultado = $stmt->get_result();
        if ($usuario = $resultado->fetch_assoc()) {
            if (hash("sha256", $senha) === $usuario["senha_hash"]) {
            session_regenerate_id(true);
            $_SESSION["usuario_id"] = $usuario["id"];
            $_SESSION["usuario_nome"] = $usuario["nome"];
            $_SESSION["ultima_atividade"] = time();
            header("Location: principal.php");
            exit;
        }
    }
    $erro = "Login ou senha inválidos.";
}
?>