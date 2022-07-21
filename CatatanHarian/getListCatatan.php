<?php
    require_once '../connection.php';

    $id = $_GET['id_periode'];

    $query = "SELECT PAKAN_HARIAN, BERAT_BADAN, TANGGAL_CATATAN_HARIAN, JUMLAH_MATI, JUMLAH_KALING, KODE_PAKAN, SISA_AYAM, UMUR_AYAM, JUMLAH_PAKAN FROM catatan_harian WHERE id_periode = ".$id;
    $result = mysqli_query($con, $query);
    $response = array();

    while ($row = mysqli_fetch_array($result)) {
        array_push($response, array(
            "pakan_harian" => "$row[0]",
            "berat_badan" => $row[1],
            "tanggal_catatan" => $row[2],
            "jumlah_mati" => $row[3],
            "jumlah_kaling" => $row[4],
            "kode_pakan" => $row[5],
            "sisa_ayam" => $row[6],
            "umur_ayam" => $row[7],
            "jumlah_pakan" => $row[8]
        ));
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>