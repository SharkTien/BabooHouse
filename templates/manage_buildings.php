<?php
session_start(); // Start the session
include '../admin/getallbuilding.php';  // Include the building retrieval script

$search = isset($_GET['search']) ? $_GET['search'] : '';
$buildings = getAllBuildings($search);
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
            <div class="manage-building-head">
                <h1>Quản Lý Toà Nhà</h1>
                <form class="mange-building-search-form" method="get" action="manage_buildings.php">
                    <input type="text" name="search" placeholder="tìm kiếm băng tên hoặc tên đăng nhập" value="<?php echo htmlspecialchars($search); ?>">
                    <button type="submit">Search</button>
                </form>
                <button class="create-building" onclick="location.href='create_building.php'">Thêm toà nhà mới</button>
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
                <?php if ($buildings): ?>
                    <?php while ($building = $buildings->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($building['name']); ?></td>
                            <td><?php echo htmlspecialchars($building['rental_price']); ?></td>
                            <td><?php echo htmlspecialchars($building['address']); ?></td>
                            <td>N/A</td>
                            <td>N/A</td>
                            <td>N/A</td>
                            <td><?php echo htmlspecialchars($building['owner_name']); ?></td>
                            <td><?php echo htmlspecialchars($building['last_modified']); ?></td> <!-- Display the last access time -->
                            <td>
                                <form action="../admin/delete_building.php" method="post" onsubmit="return confirm('Are you sure you want to delete this building?');" style="display:inline;">
                                    <input type="hidden" name="building_id" value="<?php echo $building['building_id']; ?>">
                                    <button class="delete-building" type="submit">Delete</button>
                                </form>
                                <form action="../templates/edit_building.php" method="get" style="display:inline;">
                                    <input type="hidden" name="building_id" value="<?php echo $building['building_id']; ?>">
                                    <button class="edit-building" type="submit">Edit</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                <?php else: ?>
                    <tr>
                        <td colspan="10">No buildings found</td>
                    </tr>
                <?php endif; ?>
            </table>
        </div>
        <?php include '../includes/sidebar.php'; ?>
    </div>
    <script src="../assets/js/filter.js"></script>
</body>
</html>