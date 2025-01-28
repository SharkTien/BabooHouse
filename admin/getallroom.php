<?php
require '../config/database.php';
function getAllrooms($building_id) {
    global $conn;
    $sql = "SELECT * FROM rooms WHERE building_id = ?";
    
    $stmt = $conn->prepare($sql);
    if ($building_id) {
        $stmt->bind_param("i", $building_id);
    }
    $stmt->execute();
    $result = $stmt->get_result();
    return $result;
}
?>
