<?php
   session_start();
   if(!isset($_SESSION['idFuncionário']))
   {
       header("location:index.php");
       exit;
   }
?>

<?php
$nome = ('beautyrecord');
$host = ('127.0.0.1');
$usuario = ('root');
$senha= ('');

try 
{
    $pdo = new PDO("mysql:dbname=" .$nome.";host=" .$host, $usuario, $senha);
} catch (PDOException $e) 
{
    $msgErro = $e->getMessage();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros de Procedimentos</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div id="back">
    <a href="voltar.php"> <img src="icons8-à-esquerda.png" alt=""></a>
</div>

    <h1>Registros de Procedimentos </h1>

    <?php
    //SQL p selecionar os registros
    $result_atendimento =  ("SELECT idAtendimento, atendimento.data_hora, funcionário.nome AS nomefunc,  procedimentos.nomeProcedimento AS nomeproced, cliente.nome AS nomeclnt FROM atendimento
    JOIN funcionário
    ON atendimento.Funcionário_idFuncionário =  funcionário.idFuncionário
    JOIN procedimentos
    ON atendimento.Procedimentos_idProcedimento = procedimentos.idProcedimento
    JOIN cliente 
    ON atendimento.Cliente_idCliente = cliente.idCliente");

    //Seleciona os registros
    $resultado_atendimento = $pdo->prepare($result_atendimento);
    $resultado_atendimento->execute();

    while ($row_atendimento = $resultado_atendimento->fetch(PDO:: FETCH_ASSOC)){
        echo "ID atendimento: " . $row_atendimento['idAtendimento'] .  "<br>";
        echo "Data/Hora: " . $row_atendimento['data_hora'] .  "<br>";
        echo "Funcionário: " . $row_atendimento['nomefunc'] .  "<br>";
        echo "Procedimento: " . $row_atendimento['nomeproced'] .  "<br>";
        echo "Cliente: " . $row_atendimento['nomeclnt'] .  "<br><hr>";
    }
    ?>


</body>
</html>
