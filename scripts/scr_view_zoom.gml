/// scr_view_zoom(amount, view)

var amount = 1+argument[0];
var view = argument[1];

// limit zoom
if(view_wview[view] <= 1920 && amount < 1){
    exit;
}
if(view_wview[view] >= 7040 && amount > 1){
    exit;
}

// get offset
var offx = abs(view_wview[view]*amount - view_wview[view]);
var offy = abs(view_hview[view]*amount - view_hview[view]);

// scale view
view_wview[view] *= amount;
view_hview[view] *= amount;

// adjust view pos
if(amount < 1){
    view_xview[view] += offx/2;   
    view_yview[view] += offy/2;  
} else if(amount > 1){
    view_xview[view] -= offx/2;   
    view_yview[view] -= offy/2; 
}

    if(view_xview[0] - amount <= 0){
        view_xview[0] = 0;
    } else{
        view_xview[0] -= amount;
    }
    if(view_xview[0] + view_wview[0] + amount >= room_width){
        view_xview[0] = room_width - view_wview[0];
    } else{
        view_xview[0] += amount;
    }
    if(view_yview[0] + view_hview[0] + amount >= room_height){
        view_yview[0] = room_height - view_hview[0];
    } else{
        view_yview[0] += amount;
    }
    if(view_yview[0] - amount <= 0){
        view_yview[0] = 0;
    } else{
        view_yview[0] -= amount;
    }
