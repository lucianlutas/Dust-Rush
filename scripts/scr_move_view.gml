/// scr_move_view(amount)

var amount = argument[0];

// get input
var right = keyboard_check(vk_right) || keyboard_check(ord('D'));
var left = keyboard_check(vk_left) || keyboard_check(ord('A'));
var up = keyboard_check(vk_up) || keyboard_check(ord('W'));
var down = keyboard_check(vk_down) || keyboard_check(ord('S'));

// move view according to input
if(right){
    if(view_xview[0] + view_wview[0] + amount >= room_width){
        view_xview[0] = room_width - view_wview[0];
    } else{
        view_xview[0] += amount;
    }
}
if(left){
    if(view_xview[0] - amount <= 0){
        view_xview[0] = 0;
    } else{
        view_xview[0] -= amount;
    }
}
if(up){
    if(view_yview[0] - amount <= 0){
        view_yview[0] = 0;
    } else{
        view_yview[0] -= amount;
    }
}
if(down){
    if(view_yview[0] + view_hview[0] + amount >= room_height){
        view_yview[0] = room_height - view_hview[0];
    } else{
        view_yview[0] += amount;
    }
}

// move view according to mouse

if(mouse_x <= view_xview[0]+30){
    if(view_xview[0] - amount <= 0){
        view_xview[0] = 0;
    } else{
        view_xview[0] -= amount;
    }
}
if(mouse_x >= view_xview[0] + view_wview[0] - 40){
    if(view_xview[0] + view_wview[0] + amount >= room_width){
        view_xview[0] = room_width - view_wview[0];
    } else{
        view_xview[0] += amount;
    }
}
if(mouse_y >= view_yview[0] + view_hview[0] - 40){
    if(view_yview[0] + view_hview[0] + amount >= room_height){
        view_yview[0] = room_height - view_hview[0];
    } else{
        view_yview[0] += amount;
    }
}
if(mouse_y <= view_yview[0] + 30){
    if(view_yview[0] - amount <= 0){
        view_yview[0] = 0;
    } else{
        view_yview[0] -= amount;
    }
}
