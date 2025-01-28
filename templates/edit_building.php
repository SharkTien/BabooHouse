<?php
session_start();
require '../config/database.php';
include '../admin/getallbuilding.php';  

$building_types = getDistinctBuildingTypes();

if (isset($_GET['building_id'])) {
    $building_id = $_GET['building_id'];

    // Fetch building details
    $sql = "SELECT * FROM buildings WHERE building_id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die('Prepare failed: ' . htmlspecialchars($conn->error));
    }
    $stmt->bind_param("i", $building_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $building = $result->fetch_assoc();
    $stmt->close();
} else {
    die("building ID not provided.");
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $address = $_POST['address'];
    $owner_phone = $_POST['owner_phone'];
    $owner_name = $_POST['owner_name'];
    $building_type = $_POST['building_type'];
    $electricity_price = $_POST['electricity_price'];
    $water_price = $_POST['water_price'];
    $description = $_POST['description'];
    $sql = "UPDATE buildings SET name = ?, address = ?, owner_phone = ?, owner_name = ?, building_type = ?, electricity_price = ?, water_price = ?, description = ?, last_modified = NOW() WHERE building_id = ?";
    $stmt = $conn->prepare($sql);
    if ($stmt === false) {
        die('Prepare failed: ' . htmlspecialchars($conn->error));
    }
    $stmt->bind_param("ssssssssi", $name, $address, $owner_phone, $owner_name, $building_type, $electricity_price, $water_price, $description, $building_id);
    $stmt->execute();

    if ($stmt->affected_rows > 0) {
        echo "building updated successfully.";
    } else {
        echo "Error updating building: " . htmlspecialchars($stmt->error);
    }
    $stmt->close();
    $conn->close();

    // Redirect to manage_buildings.php
    header("Location: manage_buildings.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Người Dùng</title>
</head>
<body>
    <?php include '../includes/header.php'; ?> <!-- Bao gồm tiêu đề -->

    <div class="head-container">
        <div class="main-content" id="edit-building">
            <h1>Chỉnh Sửa Người Dùng</h1>
            <form action="edit_building.php?building_id=<?php echo $building_id; ?>" method="post">
                <div class="form-group">
                    <label for="name">Tên toà nhà:</label>
                    <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($building['name']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="address">Địa chỉ:</label>
                    <input type="text" id="address" name="address" value="<?php echo htmlspecialchars($building['address']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="owner_phone">Số điện thoại chủ nhà:</label>
                    <input type="text" id="owner_phone" name="owner_phone" value="<?php echo htmlspecialchars($building['owner_phone']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="owner_name">Tên chủ nhà:</label>
                    <input type="text" id="owner_name" name="owner_name" value="<?php echo htmlspecialchars($building['owner_name']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="building_type">Loại hình cho thuê</label>
                    <select id="building_type" name="building_type">
                        <option value="Trống" selected>Trống</option>
                        <?php foreach ($building_types as $type): ?>
                            <option value="<?php echo htmlspecialchars($type); ?>" <?php echo ($building['building_type'] == $type) ? 'selected' : ''; ?>><?php echo htmlspecialchars($type); ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="form-group">
                    <label for="electricity_price">Tiền điện:</label>
                    <input type="float" id="electricity_price" name="electricity_price" value="<?php echo htmlspecialchars($building['electricity_price']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="water_price">Tiền nước:</label>
                    <input type="float" id="water_price" name="water_price" value="<?php echo htmlspecialchars($building['water_price']); ?>" required>
                </div>
                <div class="form-group">
                    <label for="description">Tiện nghi:</label>
                    <input type="text" id="description" name="description" value="<?php echo htmlspecialchars($building['description']); ?>" required>
                </div>
                <button type="submit">Lưu</button>
                <button class="cancel-btn" onclick="window.history.back();">Hủy</button>
            </form>
        </div>
        <?php include '../includes/sidebar.php'; ?> <!-- Bao gồm thanh bên -->
    </div>
</body>
</html>