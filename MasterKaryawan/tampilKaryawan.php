<?php
    require_once '../connection.php';

    $karyawan = "SELECT pg.nama, jb.nama_jabatan, pg.no_telp, pg.email, pg.status FROM pegawai pg JOIN jabatan jb ON jb.id_jabatan = pg.id_jabatan WHERE pg.id_jabatan = 2  ";
    $result = mysqli_query($con, $karyawan);
    $response = array();


    while ($row = mysqli_fetch_array($result)) {
        if($row[4] == "1"){
            $status = "Aktif";
            array_push($response, array(
                "nama" => "$row[0]",
                "jabatan" => "$row[1]",
                "notelp" => "$row[2]",
                "email" => "$row[3]",
                "status" => $status
            ));
        }else{
            $status = "Belum Aktif";
            array_push($response, array(
                "nama" => "$row[0]",
                "jabatan" => "$row[1]",
                "notelp" => "$row[2]",
                "email" => "$row[3]",
                "status" => $status
            ));
        }
    }

    echo json_encode(array("server_response" => $response));
    mysqli_close($con);
?>