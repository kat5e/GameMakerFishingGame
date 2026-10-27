if (just_opened) {
    just_opened = false;
    exit;
}

if (keyboard_check_pressed(ord("E"))) {
    instance_destroy();
}