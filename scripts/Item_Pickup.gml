///Item Pickup

for(i = 0; i < maxSlots; i++){
    if(global.inventory[i,0] = ""){
        global.inventory[i,0] = argument0;
        i = maxSlots;
    }
}
