<?php
   session_start();
   unset($_SESSION['idFuncionário']);
   header("location:index.php");
?>