<?php
    require_once '../connection.php';

    if ($con) {
        $id = $_POST['id'];
        $hari = $_POST['hari'];
        $umur = $_POST['umur'];
        $berat = $_POST['berat'];
        $sisa = $_POST['sisa'];
        $kode = $_POST['kode'];
        $jml_pakan = $_POST['jml_pakan'];
        $jml_kaling = $_POST['jml_kaling'];
        $jml_mati = $_POST['jml_mati'];

        $insert = "INSERT INTO catatan_harian(ID_PERIODE , ID_KANDANG, ID_CATATAN, ID_PEGAWAI, 
                    KODE_PAKAN, JUMLAH_KALING, JUMLAH_MATI, TANGGAL_CATATAN_HARIAN, BERAT_BADAN, STATUS_VAKSIN, PAKAN_HARIAN,
                    ID_PANEN, SISA_AYAM, UMUR_AYAM, JUMLAH_PAKAN) VALUES('$id', 1, '$id', 1, '$kode', '$jml_kaling', '$jml_mati', '$hari', '$berat', 'sudah', '', '', '$sisa', '$umur', '$jml_pakan') ";
        
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

    echo json_encode(array("server_response" => $response ));
    mysqli_close($con);

?>