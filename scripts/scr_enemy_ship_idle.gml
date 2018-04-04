/// scr_enemy_ship_idle()

// set friction
friction = 0;

//direction = irandom_range(0, 359);

if(foe != -1 && instance_exists(foe)){
    if(distance_to_point(foe.x, foe.y) <= 800){
        state = 'chase';
    }
}
