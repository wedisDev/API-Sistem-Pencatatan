<?php
    require_once '../connection.php';

    if ($con) {
        $id_jabatan = 1;
        $nama = $_POST['nama'];
        $noTelp = $_POST['noTelp'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $status = 1;

        $insert = "INSERT INTO pegawai(id_jabatan, nama, no_telp, email, password, status) VALUES('$id_jabatan', '$nama', '$noTelp', '$email', '$password', '$status') ";
        
        if ($id_jabatan != "" && $nama != "" && $noTelp != "" && $email != "" && $password != "" && $status != "") {

            $result = mysqli_query($con, $insert);
            $response = array();

            if ($result) {
                array_push($response, array(
                    'status' => 'Registrasi Berhasil'
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