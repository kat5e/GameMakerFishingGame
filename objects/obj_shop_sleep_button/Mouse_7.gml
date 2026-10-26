//right now sleeping just resets the daynight shader to be morning
//more code can be added to move to the end of day room 
//and then display text for the story before returning to the game
obj_daynight.time_of_day = 0;
obj_fishshop.shop_open = false;
obj_fishshop.update_shop();