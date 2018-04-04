///draw_fog(x1,y1,x2,y2,n,grid);
/* Created by Trevor Madge 2016 */

var x1,y1,x2,y2,nn;

x1 = argument0; //left
y1 = argument1; //top
x2 = argument2; //right
y2 = argument3; //bottom
nn = argument4; //Max recursions
grid = argument5; //Grid to check
var w = abs(x1-x2);
var h = abs(y1-y2);



var col = ds_grid_get_max(grid,x1 div foc,y1 div foc,x2 div foc,y2 div foc);// point_in_rectangle(x,y,x1,y1,x2,y2);

nn-=1;
if col == 1 then
{
    if nn>0 then
    {
        draw_fog(x1,y1,x2-(w/2),y2-(h/2),nn,grid);//tl
        draw_fog(x2-(w/2),y1,x2,y2-(h/2),nn,grid);//tr
        draw_fog(x1,y1+(h/2),x2-(w/2),y2,nn,grid);//bl
        draw_fog(x2-(w/2),y1+(h/2),x2,y2,nn,grid);//br
    }
}
else
{
    draw_set_colour(c_black);
    if (w*0.5)<foc then 
    {
        draw_set_alpha((w*0.5)/foc);
    }
    else
    {
        draw_set_alpha(1);
    }
    draw_roundrect(x1-foc,y1-foc,x2+foc,y2+foc,0);
    //draw_roundrect_colour_ext(x1-foc,y1-foc,x2+foc,y2+foc,foc,foc,c_lime,c_lime,1);
}
