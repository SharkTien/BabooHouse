<div class="sidebar">
    <ul>
        <li class="accordion-item">
            <a href="javascript:void(0)" class="accordion-toggle">Lưu trú</a>
            <div class="accordion-content">
                <a href="#">Thông tin lưu trú</a>
                <a href="../templates/manage_buildings.php">Quản lý toà nhà</a>
            </div>
        </li>
        <li class="accordion-item">
            <a href="javascript:void(0)" class="accordion-toggle">Doanh thu</a>
            <div class="accordion-content">
                <a href="#">Doanh thu Sale</a>
                <a href="#">Quản lý</a>
            </div>
        </li>
        <li><a href="#">Hợp đồng</a></li>
        <?php if (isset($_SESSION['role']) && $_SESSION['role'] == 'admin'): ?>
        <li><a href="../templates/manage_users.php">Quản lý người dùng</a></li>
        <?php endif; ?>
    </ul>
</div>
