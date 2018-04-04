/// scr_ship_move()

// set friction to 0
friction = 0;


// move to target if exists
if(instance_exists(target)){
    motion_add(point_direction(x, y, target.x, target.y), acc);
    
    // delete target when reached
    if(position_meeting(x, y, target)){
        with(target){
            instance_destroy();
        }
        state = 'idle';
    }
}

// dont go faster than max speed
if(speed > spd){
    speed = spd;
}
