<?php
    require_once '../connection.php';

    $query = "SELECT DATE_FORMAT(periode_ternak.tanggal_datang, '%d %M %Y') as tanggal_datang, periode_ternak.jumlah_bibit, periode_ternak.id_periode, kandang.nama_kandang, kandang.id_kandang
                FROM periode_ternak JOIN kandang ON periode_ternak.ID_KANDANG = kandang.ID_KANDANG";
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "tanggal_datang" => "$row[0]",
            "jumlah_bibit" => $row[1],
            "id_periode" => $row[2],
            "nama_kandang" => $row[3],
            "id_kandang" => $row[4],
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>