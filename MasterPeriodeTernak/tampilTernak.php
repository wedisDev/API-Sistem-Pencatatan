<?php
    require_once '../connection.php';

    $query = "SELECT DATE_FORMAT(tanggal_datang, '%d %M %Y') as tanggal_datang, jumlah_bibit, id_periode FROM periode_ternak";
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "tanggal_datang" => "$row[0]",
            "jumlah_bibit" => $row[1],
            "id_periode" => $row[2]
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>