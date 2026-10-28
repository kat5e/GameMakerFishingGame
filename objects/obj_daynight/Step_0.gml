if (global.sleep_active) exit;

//day cycle is about 5 minutes
if (time_of_day < 1) {
	time_of_day += ( 1 / (60 * 60 * day_length));
}

//number is found by dividing 1 by fps (60) times seconds in a minute (60) times (minute amount (?)
//5 minutes = 0.000556
