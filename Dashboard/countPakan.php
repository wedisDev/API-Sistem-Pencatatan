<?php
    require_once '../connection.php';

    $query = "SELECT sum(stok_pakan) as stok_pakan FROM pakan";
    $hasil  = mysqli_query($con, $query);
    $json_response = array();

    if(mysqli_num_rows($hasil)> 0){
        while ($row = mysqli_fetch_array($hasil)) {
            $json_response[] = $row;
    }
    echo json_encode(array('pakan' => $json_response));}

?>