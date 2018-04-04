/// scr_enemy_ship_attack()

// face direction of movement
if(foe != -1 && point_distance(x, y, foe.x, foe.y) <= 350 && foe.type == 'ship'){
    image_angle = point_direction(x, y, foe.x, foe.y);
    if(alarm[0] == -1 && weapon != -1){
        var laser = instance_create(x, y, weapon);
        laser.direction = image_angle;
        laser.image_angle = image_angle;
        alarm[0] = 15;
    }
} else if(foe != -1 && point_distance(x, y, foe.x, foe.y) <= 550 && foe.type == 'building'){
    image_angle = point_direction(x, y, foe.x, foe.y);
    if(alarm[0] == -1 && weapon != -1){
        var laser = instance_create(x, y, weapon);
        laser.direction = image_angle;
        laser.image_angle = image_angle;
        alarm[0] = room_speed/2;
    }
}

friction = 0.8;
if(instance_exists(foe) && foe != -1){
    direction = point_direction(x, y, foe.x, foe.y);
    if(distance_to_point(foe.x, foe.y) <= 800 && foe.type == 'building'){
        state = 'chase';
    }
    else if(distance_to_point(foe.x, foe.y) <= 500 && foe.type == 'ship'){
        state = 'chase';
    }
}
