/// scr_ship_init(hp, weapon, [size])

target = -1;
selected = false;
state = 'idle';
spd = 6;
acc = 1;
hp = argument[0];
weapon = argument[1];
if(argument_count > 2){
    size = argument[2];
}

