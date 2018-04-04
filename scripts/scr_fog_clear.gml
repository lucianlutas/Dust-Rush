/// scr_fog_clear(x, y, radius)

if(instance_exists(obj_fow)){
    ds_grid_set_disk(obj_fow.fog_grid, floor(argument[0]/32), floor(argument[1]/32), argument[2], 1);
}
