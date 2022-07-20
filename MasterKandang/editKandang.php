<?php
    require_once '../connection.php';

    if ($con) {
        $id_kandang = $_POST['id_kandang'];
        $nama_kandang = $_POST['nama_kandang'];
        $kapasitas = $_POST['kapasitas'];

        $insert = "UPDATE kandang set nama_kandang ='$nama_kandang', kapasitas='$kapasitas' WHERE id_kandang ='$id_kandang' ";
        
        if ($nama_kandang != "" && $kapasitas != "" ) {

            $result = mysqli_query($con, $insert);
            $response = array();

            if ($result) {
                array_push($response, array(
                    'status' => 'Edit Kandang Berhasil'
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