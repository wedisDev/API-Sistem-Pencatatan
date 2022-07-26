<?php
    require_once '../connection.php';

    if ($con) {
        $tanggal_panen = $_POST['tanggal_panen'];
        $berat_hasil = $_POST['berat_hasil'];
        $jumlah_hasil = $_POST['jumlah_hasil'];
        $id_periode = $_POST['id_periode'];

        $insert = "INSERT INTO panen(
                    TANGGAL_PANEN,
                    BERAT_HASIL,
                    JUMLAH_HASIL
                    ) 
                    VALUES(
                        '$tanggal_panen', 
                        '$berat_hasil',
                        '$jumlah_hasil'
                    ) ";

        
        $result = mysqli_query($con, $insert);
        $response = array();

        if ($result) {
            $update = "UPDATE periode_ternak SET STATUS_PERIODE=0 WHERE ID_PERIODE='".$id_periode."'";
            $result = mysqli_query($con, $update);
            if ($result) {}
            array_push($response, array(
                'status' => "0".mysqli_error($con)
            ));
        }else {
            array_push($response, array(
                'status' => '0'.mysqli_error($con)
            ));
        }
    }else {
        array_push($response, array(
            'status' => '0'.mysqli_error($con)
        ));
    }

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

