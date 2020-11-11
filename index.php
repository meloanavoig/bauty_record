<?php
   require_once 'CLASSES/funcionarios.php';
   $u = new usuario;
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
 <img class= displayed src="logo.png" alt=""> 
 <div class="container">
        <div class="content first-content">
        <h2 class="title">Login</h2>
        <form action="index.php" method="POST">
           <input type="name" placeholder="nome" maxlength="45" name="nome">
           <input type="number" placeholder="CPF" maxlength="11" name="CPF">
            <input type="submit" value="Sign in" class="btn btn-primary">
        </form>
    </div>
     
<?php

if(isset($_POST['nome']))
{
        $nome = addslashes($_POST['nome']);
        $CPF = addslashes($_POST['CPF']);
 var_dump($nome);
 var_dump($CPF);
 

        if(!empty($nome) && !empty($CPF))
        {
            $u->conectar("beautyrecord", "localhost", "root", ""); 

                if($u->msgErro == "")
                {
                    if($u->logar($nome,$CPF))
                    {
                        header("location:registros.php"); 
                    }else{

                        ?>
                            <div class="msgerro">
                                <?php echo "Nome e/ou CPF estão incorretos!"; ?> 
                            </div>
                        <?php

                    
                    }

                }else{
                        ?>
                            <div class="msgerro">
                            <?php echo "Erro: ".$u->msgErro; ?> 
                            </div>
                        <?php
                     }

        }else{

            ?>
                <div class="msgerro">
                <?php echo "Prencha todos os campos!"; ?>
                </div>
            <?php
            }
}
    
?>

</body>
</html>
