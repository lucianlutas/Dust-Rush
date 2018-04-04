/// scr_toggle_select(press_x, press_y, release_x, release_y)
if(!position_meeting(mouse_x, mouse_y, obj_minimap_overlay)){
// press
var px = argument[0];
var py = argument[1];

// release
var rx = argument[2];
var ry = argument[3];

// cases
var tlbr = (x>px && x<rx && y>py && y<ry);
var bltr = (x>px && x<rx && y<py && y>ry);
var brtl = (x<px && x>rx && y<py && y>ry);
var trbl = (x<px && x>rx && y>py && y<ry);

if(tlbr || bltr || brtl || trbl){
    selected = true;
} else{
    selected = false;
}
}
