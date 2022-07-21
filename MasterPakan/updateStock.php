<?php
    require_once '../connection.php';

    if ($con) {
        $response = array();
        //mendapatkan data
        $kode_pakan = $_POST['kode_pakan'];
        $pakan_masuk = $_POST['pakan_masuk'];
        
        $sql = "UPDATE pakan SET stok_pakan = (stok_pakan+'$pakan_masuk' )WHERE kode_pakan = '$kode_pakan'";
        if(mysqli_query($con,$sql)) {
            $response["message"] = "Berhasil diperbarui";
            echo json_encode($response);

        } else {
            $response["message"] = "oops! Gagal merubah!";
            echo json_encode($response);
        }
    }

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

?>