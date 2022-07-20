<?php
    require_once '../connection.php';

    if ($con) {
        $kode_pakan = $_POST['kode_pakan'];
        $tanggal_masuk = $_POST['tanggal_masuk'];
        $pakan_masuk = $_POST['pakan_masuk'];

        $insert = "INSERT INTO pencatatan_pakan_masuk(kode_pakan, tanggal_masuk, pakan_masuk) VALUES('$kode_pakan', '$tanggal_masuk', '$pakan_masuk') ";
        
        if ($kode_pakan != "" && $tanggal_masuk != "" && $pakan_masuk !="" ) {

            $result = mysqli_query($con, $insert);
            $response = array();

            if ($result) {
                array_push($response, array(
                    'status' => 'Update Berhasil'
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