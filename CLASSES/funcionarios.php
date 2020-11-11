<?php

Class usuario{

        private $pdo;
        public $msgErro = ""; //se estiver vazia ok 

    public function conectar ($nome, $host, $usuario, $senha)
    {
        global $pdo;
        global $msgErro;
                 
        try 
        {
            $pdo = new PDO("mysql:dbname=" .$nome.";host=" .$host, $usuario, $senha);
        } catch (PDOException $e) 
        {
            $msgErro = $e->getMessage();
        }
        

    }

   
    public function logar($nome, $CPF) 
    {
        global $pdo;

        //verificando se  já está cadastrado
        $sql = $pdo->prepare("SELECT idFuncionário FROM funcionário WHERE nome = :n AND CPF = :c"); 
        $sql->bindValue(":n",$nome);
        $sql->bindValue(":c",($CPF));
        $sql->execute();

        if($sql->rowCount() > 0 )
        {
            //entrar no sistema 

            $dado = $sql->fetch();  
            session_start();
            $_SESSION['idFuncionário'] = $dado['idFuncionário'];
            
            return true; //login feito com sucesso
        }
        else
        {
            return false; //não foi possível fazer login
        }
    }

    
}
?>
