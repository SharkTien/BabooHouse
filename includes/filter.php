<div class="sidebar">
    <h2>Bộ lọc</h2>
    <label for="price-range">Mức giá (nghìn đồng):</label>
    <form class="filter-form" method="get" action="manage_buildings.php">
        <div class="price-input">
            <div class="field">
            <span>Tối thiểu</span>
            <input type="number" name="min_price" class="input-min" value="<?php echo htmlspecialchars($min_price); ?>">
            </div>
            <div class="separator">-</div>
            <div class="field">
            <span>Tối đa</span>
            <input type="number" name="max_price" class="input-max" value="<?php echo htmlspecialchars($max_price); ?>">
            </div>
        </div>
        <div class="slider-container">
            <div class="slider">
                <div class="progress"></div>
            </div>
            <div class="range-input">
                <input type="range" class="range-min" min="0" max="10000" value="<?php echo htmlspecialchars($min_price); ?>" step="1">
                <input type="range" class="range-max" min="0" max="10000" value="<?php echo htmlspecialchars($max_price); ?>" step="1">
            </div>
        </div>

        <h3>Loại Toà Nhà</h3>
        <div class="checkbox-container">
            <input type="checkbox" name="building_type[]" value="All" id="All" onclick="toggleAll(this)">
            <label for="All">Tất cả</label>
        </div>
        <?php foreach ($building_types as $type): ?>
            <div class="checkbox-container">
                <input type="checkbox" name="building_type[]" value="<?php echo htmlspecialchars($type); ?>" id="<?php echo htmlspecialchars($type); ?>" class="building-type-checkbox" onclick="updateAllCheckbox()">
                <label for="<?php echo htmlspecialchars($type); ?>"><?php echo htmlspecialchars($type); ?></label>
            </div>
        <?php endforeach; ?>
        

        <button type="submit" id="filter-button">Xem kết quả</button>
    </form>
</div>