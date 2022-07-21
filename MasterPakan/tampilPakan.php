<?php
    require_once '../connection.php';

    $query = "SELECT nama_pakan, stok_pakan FROM pakan";
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "nama_pakan" => "$row[0]",
            "stok_pakan" => $row[1]
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>