<?php
    $conexao = new mysqli("localhost", "root", "", "saep_db");
    if ($conexao->connect_error) {
        die("Erro na conexão com o banco de dados.");
    }
    $conexao->set_charset("utf8mb4");
?>