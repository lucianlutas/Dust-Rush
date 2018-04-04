///scr_create_explosion(x, y, size)

xx = argument[0];
yy = argument[1];

size = argument [2]; 

explosion = instance_create(xx, yy, obj_explosion);
explosion.image_xscale = size;
explosion.image_yscale = size;

