/// scr_enemy_ship_chase()

// set friction
friction = 0;

//move to target if exists
if(instance_exists(foe)){
    // attack foe when reach
    if(foe.type == 'building'){
        if(distance_to_point(foe.x, foe.y) <= 500){
            state = 'attack';
        } else{
            motion_add(point_direction(x, y, foe.x, foe.y), acc);
        }
    } else if(foe.type == 'ship'){
        if(distance_to_point(foe.x, foe.y) <= 300){
            state = 'attack';
        } else{
            motion_add(point_direction(x, y, foe.x, foe.y), acc);
        }
    }
}

// limit speed
if(speed > spd){
    speed = spd;
}
