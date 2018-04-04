/// scr_move_to(x, y)

// set friction to 0
friction = 0;

xx = argument[0];
yy = argument[1];


// move to target if exists
    motion_add(point_direction(x, y, xx, yy), acc);
    
    
    if(x == xx && y == yy){
        state = 'idle';
    }

// dont go faster than max speed
if(speed > spd){
    speed = spd;
}
