#define FogOfWar_madgetr_draw
///FogOfWar_madgetr_draw(x1,y1,x2,y2,n,grid);
/* Created by Trevor Madge 2016 */

var x1,y1,x2,y2,nn,grid;

x1 = argument0; //left
y1 = argument1; //top
x2 = argument2; //right
y2 = argument3; //bottom
nn = argument4; //Max recursions
grid = argument5; //Grid to check

var w = abs(x1-x2);
var h = abs(y1-y2);

var col = ds_grid_get_min(grid,x1 div foc,y1 div foc,x2 div foc,y2 div foc);
nn-=1;
if col == 0 then
{
    if nn>0 then
    {
        FogOfWar_madgetr_draw(x1,y1,x2-(w/2),y2-(h/2),nn,grid);//tl
        FogOfWar_madgetr_draw(x2-(w/2),y1,x2,y2-(h/2),nn,grid);//tr
        FogOfWar_madgetr_draw(x1,y1+(h/2),x2-(w/2),y2,nn,grid);//bl
        FogOfWar_madgetr_draw(x2-(w/2),y1+(h/2),x2,y2,nn,grid);//br
    }
}
else
{
    draw_sprite_stretched(spr_pixel,0,x1,y1,w,h);
}

#define FogOfWar_madgetr_reveal
///FogOfWar_madgetr_reveal(x,y,raduis):
with(obj_fog)
{
    if !ds_exists(grid,ds_type_grid) then continue;
    ds_grid_set_disk(grid,argument0 div foc, argument1 div foc,(argument2+64) div foc,1);
}

#define FogOfWar_madgetr_init
///FogOfWar_madgetr_init(Focus,Colour,Radius,Quality):
foc = max(argument0,1);
colour = argument1;
Radius = max(argument2,0);
Quality = clamp(argument3,1,15);
if Quality == 1 then Radius = 0;
var w,h;
w = room_width;
h = room_height;
grid = ds_grid_create(w div foc, h div foc);
surf = surface_create(view_wport,view_hport);

#define FogOfWar_madgetr_step
///FogOfWar_madgetr_step():
if !ds_exists(self.grid,ds_type_grid) 
{
    self.grid = ds_grid_create(room_width div foc, room_height div foc);
}
if !surface_exists(surf) then surf = surface_create(view_wport,view_hport);

surface_set_target(surf);
draw_set_blend_mode( bm_add );
draw_set_colour(c_white);
draw_set_alpha(0.4);
draw_rectangle( 0, 0, view_wport-1, view_hport-1, false );
draw_set_alpha(1);
d3d_transform_set_identity();
d3d_transform_add_translation( -(view_xview), -(view_yview), 0 );
d3d_transform_add_scaling( view_wport / view_wview, view_hport / view_hview, 1 );
draw_set_blend_mode( bm_subtract );
var s = max(view_wview,view_hview);
FogOfWar_madgetr_draw(view_xview- (view_xview mod foc),view_yview- (view_yview mod foc),view_xview+s- (view_xview mod foc),view_yview+s- (view_yview mod foc),7,grid);
draw_set_blend_mode( bm_normal );
d3d_transform_set_identity();
surface_reset_target();

#define FogOfWar_madgetr_drawEvent
if surface_exists(surf) then 
{
var resolution = shader_get_uniform(sh_rblur,"resolution");
var radius = shader_get_uniform(sh_rblur,"radius");
var dir = shader_get_uniform(sh_rblur,"dir");
var radial_origin = shader_get_uniform(sh_rblur,"radial_origin");

shader_set(sh_rblur)
shader_set_uniform_f(resolution,max(view_wport,view_hport));
shader_set_uniform_f(radius,Quality);

for (i=-1; i<1; i+=1)
for (ii=-1; ii<1; ii+=1)
{
    shader_set_uniform_f(dir,i,ii);
    for( var d=0;d<360;d+=360/(Quality*2) )
    {
        var xx,yy;
        xx = lengthdir_x(Radius,d);
        yy = lengthdir_y(Radius,d);
        draw_surface_stretched_ext(surf,xx-foc,yy-foc,view_wport+(foc*3),view_hport+(foc*3),colour,1);
    }
};
shader_reset();
};

#define FogOfWar_madgetr_free
if ds_exists(grid,ds_type_grid) ds_grid_destroy(grid);
if surface_exists(surf) then surface_free(surf);