<?php
    require_once '../connection.php';

    $query = "SELECT TANGGAL_PANEN, JUMLAH_HASIL FROM panen";
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "tanggal_panen" => "$row[0]",
            "jumlah_hasil" => $row[1]
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>