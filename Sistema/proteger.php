<?php
session_start();

$tempo_maximo = 1800; // 30 minutos

if (!isset($_SESSION["usuario_id"])) {
    header("Location: login.php");
    exit;
}
if (
    isset($_SESSION["ultima_atividade"]) &&
    time() - $_SESSION["ultima_atividade"] > $tempo_maximo
) {
    session_unset();
    session_destroy();
    header("Location: login.php?expirou=1");
    exit;
}
$_SESSION["ultima_atividade"] = time();
?>