<?php
    require_once '../connection.php';

    if ($con) {
        $id_periode = $_POST['id_periode'];
        $id_kandang = $_POST['id_kandang'];
        // $id_catatan = $_POST['id_catatan'];
        $id_karyawan = $_POST['id_karyawan'];
        $kode_pakan = $_POST['kode_pakan'];
        $jumlah_kaling = $_POST['jumlah_kaling'];
        $jumlah_mati = $_POST['jumlah_mati'];
        $tanggal_catatan_harian = $_POST['tanggal_catatan_harian'];
        $berat_badan = $_POST['berat_badan'];
        $status_vaksin = $_POST['status_vaksin'];
        $pakan_harian = $_POST['pakan_harian'];
        $id_panen = $_POST['id_panen'];
        $sisa_ayam = $_POST['sisa_ayam'];
        $umur_ayam = $_POST['umur_ayam'];
        $jumlah_pakan = $_POST['jumlah_pakan'];

        $insert = "INSERT INTO catatan_harian(
                    ID_PERIODE,
                    ID_KANDANG,
                    ID_PEGAWAI, 
                    KODE_PAKAN, 
                    JUMLAH_KALING, 
                    JUMLAH_MATI, 
                    TANGGAL_CATATAN_HARIAN, 
                    BERAT_BADAN, 
                    STATUS_VAKSIN, 
                    PAKAN_HARIAN,
                    ID_PANEN, 
                    SISA_AYAM, 
                    UMUR_AYAM, 
                    JUMLAH_PAKAN
                    ) 
                    VALUES(
                        '$id_periode', 
                        '$id_kandang',
                        '$id_karyawan', 
                        '$kode_pakan', 
                        '$jumlah_kaling', 
                        '$jumlah_mati', 
                        '$tanggal_catatan_harian', 
                        '$berat_badan', 
                        '$status_vaksin', 
                        '$pakan_harian', 
                        '$id_panen', 
                        '$sisa_ayam', 
                        '$umur_ayam', 
                        '$jumlah_pakan'
                    ) ";
        
        $result = mysqli_query($con, $insert);
        $response = array();

        if ($result) {
            array_push($response, array(
                'status' => '1'
            ));
        }else {
            array_push($response, array(
                'status' => '0'
            ));
        }
    }else {
        array_push($response, array(
            'status' => '0'
        ));
    }

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

