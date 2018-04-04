/// scr_ship_mine_move(target)

// set friction to 0
friction = 0;
var tar = argument[0]

// move to target if exists
if(instance_exists(tar)){
    motion_add(point_direction(x, y, tar.x, tar.y), acc);
    
    // delete target when reached
    if(position_meeting(x, y, tar)){
        state = 'idle';
    }
}

// dont go faster than max speed
if(speed > spd){
    speed = spd;
}
