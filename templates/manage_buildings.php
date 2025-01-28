<?php
session_start();
include '../admin/getallbuilding.php';  

$min_price = isset($_GET['min_price']) ? (int)$_GET['min_price'] : 0;
$max_price = isset($_GET['max_price']) ? (int)$_GET['max_price'] : 10000;
$selected_types = isset($_GET['building_type']) ? $_GET['building_type'] : [];

$buildings = getAllBuildings($min_price, $max_price, $selected_types);
$building_types = getDistinctBuildingTypes();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Toà Nhà</title>
    <link href="../assets/css/filter.css" rel="stylesheet"> 
</head>
<body>
    <?php include '../includes/header.php'; ?>
    <div class="head-container">
        <?php include '../includes/filter.php'; ?>
        <div class="main-content">
            <div class="manage-head">
                <h1>Quản Lý Toà Nhà</h1>
                <button class="create" onclick="location.href='create_building.php'">Thêm toà nhà mới</button>
            </div>
            <table>
                <tr>
                    <th>Tên</th>
                    <th>Giá</th>
                    <th>Khu Vực</th>
                    <th>Tình Trạng</th>
                    <th>Công Suất</th>
                    <th>Số Phòng</th>
                    <th>Chủ Nhà</th>
                    <th>Lần Cuối Chỉnh Sửa</th>
                    <th>Thao Tác</th>   <!-- Add a new column for the action -->
                </tr>
                <?php if ($buildings->num_rows > 0): ?>
                    <?php while ($building = $buildings->fetch_assoc()): ?>
                        <tr onclick="location.href='edit_rooms.php?building_id=<?php echo htmlspecialchars($building['building_id']); ?>'" style="cursor: pointer;">
                            <td><?php echo htmlspecialchars($building['name']); ?></td>
                            <td><?php echo htmlspecialchars($building['rental_price']); ?></td>
                            <td><?php echo htmlspecialchars($building['address']); ?></td>
                            <td>N/A</td>
                            <td>N/A</td>
                            <td>N/A</td>
                            <td><?php echo htmlspecialchars($building['owner_name']); ?></td>
                            <td><?php echo htmlspecialchars($building['last_modified']); ?></td> <!-- Display the last access time -->
                            <td class="crud-btn">
                                <form action="../admin/delete_building.php" method="post" onsubmit="return confirm('Are you sure you want to delete this building?');" style="display:inline;">
                                    <input type="hidden" name="building_id" value="<?php echo $building['building_id']; ?>">
                                    <button class="delete" type="submit">Xoá</button>
                                </form>
                                <form action="../templates/edit_building.php" method="get" style="display:inline;">
                                    <input type="hidden" name="building_id" value="<?php echo $building['building_id']; ?>">
                                    <button class="edit" type="submit">Chỉnh sửa</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="10">Không tìm thấy toà nhà</td>
                    </tr>
                <?php endif; ?>
            </table>
        </div>
        <?php include '../includes/sidebar.php'; ?>
    </div>
    <script src="../assets/js/filter.js"></script>
</body>
</html>