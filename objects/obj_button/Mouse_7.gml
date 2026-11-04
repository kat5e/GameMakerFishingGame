switch (button_id) {
    case 0: 
        obj_pause_manager.paused  = false;
        obj_pause_manager.update_pause();
        break;
    case 1:
        break;
    case 2:
        obj_pause_manager.paused = false; 
        obj_pause_manager.update_pause();
        obj_start_menu_manager.started  = true; 
        obj_start_menu_manager.update_started();
        break;
}