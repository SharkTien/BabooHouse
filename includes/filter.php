<div class="sidebar">
    <h2>Bộ lọc</h2>
    <label for="price-range">Mức giá (triệu đồng):</label>
    <div class="price-input">
        <div class="field">
          <span>Tối thiểu</span>
          <input type="number" class="input-min" value="2500">
        </div>
        <div class="separator">-</div>
        <div class="field">
          <span>Tối đa</span>
          <input type="number" class="input-max" value="7500">
        </div>
    </div>
    <div class="slider-container">
        <div class="slider">
            <div class="progress"></div>
        </div>
        <div class="range-input">
            <input type="range" class="range-min" min="0" max="10000" value="2500" step="100">
            <input type="range" class="range-max" min="0" max="10000" value="7500" step="100">
        </div>
    </div>
    <button type="submit" id="filter-button">Xem kết quả</button>
</div>