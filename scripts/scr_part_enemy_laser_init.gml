/// scr_part_enemy_laser_init()

global.pt_enemy_laser = part_type_create();
var pt = global.pt_enemy_laser;
part_type_shape(pt, pt_shape_square);
part_type_size(pt, 0.05, 0.075, 0 ,0);
part_type_color3(pt, c_yellow, c_orange, c_red);
part_type_speed(pt, 1, 3, 0, 0);
part_type_direction(pt, 0, 360, 0, 0);
part_type_blend(pt, true);
part_type_life(pt, 2, 4);
part_type_alpha2(pt, 1, 0.5);
