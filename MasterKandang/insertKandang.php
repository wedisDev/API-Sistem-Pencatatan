<?php
    require_once '../connection.php';

    if ($con) {
        $nama_kandang = $_POST['nama_kandang'];
        $kapasitas = $_POST['kapasitas'];

        $insert = "INSERT INTO kandang(nama_kandang, kapasitas) VALUES('$nama_kandang', '$kapasitas') ";
        
        if ($nama_kandang != "" && $kapasitas != "" ) {

            $result = mysqli_query($con, $insert);
            $response = array();

            if ($result) {
                array_push($response, array(
                    'status' => 'Tambah Kandang Berhasil'
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