<?php
    require_once '../connection.php';

    if ($con) {
        $tanggal_datang = $_POST['tanggal_datang'];
        $jumlah_bibit = $_POST['jumlah_bibit'];

        $insert = "INSERT INTO periode_ternak(tanggal_datang, jumlah_bibit) VALUES('$tanggal_datang', '$jumlah_bibit') ";
        
        if ($tanggal_datang != "" && $jumlah_bibit != "" ) {

            $result = mysqli_query($con, $insert);
            $response = array();

            if ($result) {
                array_push($response, array(
                    'status' => 'Tambah Periode Berhasil'
                ));
            }else {
                array_push($response, array(
                    'status' => 'FAILED'
                ));
            }

        }else {
            array_push($response, array(
                'status' => 'FAILED'
            ));
        }
    }else {
        array_push($response, array(
            'status' => 'FAILED'
        ));
    }

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

?>