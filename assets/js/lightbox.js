function openLightbox(button) {
    const id = button.getAttribute('data-id');
    const name = button.getAttribute('data-name');
    const price = button.getAttribute('data-price');
    const area = button.getAttribute('data-area');
    const status = button.getAttribute('data-status');

    document.getElementById('room_id').value = id;
    document.getElementById('room_name').value = name;
    document.getElementById('room_price').value = price;
    document.getElementById('room_area').value = area;
    document.getElementById('room_status').value = status;
    document.getElementById('lightbox').style.display = 'flex';
}

