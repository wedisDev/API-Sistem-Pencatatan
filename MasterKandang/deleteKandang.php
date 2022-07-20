<?php
    require_once '../connection.php';

    if ($con) {
        $id_kandang = $_POST['id_kandang'];

        $delete = "DELETE FROM kandang WHERE id_kandang = $id_kandang ";
        
        $result = mysqli_query($con, $delete);
        $response = array();

        if ($result) {
            array_push($response, array(
                'status' => 'Delete Kandang Berhasil'
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

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

?>