<?php
    require_once '../connection.php';

    $query = "SELECT nama_kandang, kapasitas, id_kandang FROM kandang";
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "nama_kandang" => "$row[0]",
            "kapasitas" => "$row[1]",
            "id_kandang" => "$row[2]"
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>