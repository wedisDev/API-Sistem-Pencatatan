<?php
    require_once '../connection.php';

    $old_email = $_POST['old_email'];
    $nama = $_POST['nama'];
    $noTelp = $_POST['noTelp'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $status = $_POST['status'];

    $sql = "SELECT * FROM pegawai";

    $check = mysqli_query($con, $sql);
    if(mysqli_num_query($check)>0){
        $result = "UPDATE pegawai SET nama = $nama, no_telp = $noTelp, email = $email, password = $password, status = $status WHERE email =  $old_email" ;
        
        if(mysqli_query($con, $result)){
            echo "Edit data success";
        }else{
            echo "Error";
        }
    }else{
        echo "Error";
    }
?>