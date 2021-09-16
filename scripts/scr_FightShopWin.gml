///This script runs when the player won against the shop.
//arg0 = shop keeper object; arg1 = the index of the item won
var gotItem = false;
for(i = 0; i < obj_Player.maxInvSlots; i += 1){
    if(obj_Player.inventory[i,0] == "" ){    //if that slot is nothing;
        obj_Player.inventory[i,0] = argument0.shopInv[argument1,0]
        obj_Player.inventory[i,1] = argument0.shopInv[argument1,1];
        obj_Player.inventory[i,2] = argument0.shopInv[argument1,2];
        obj_Player.inventory[i,3] = argument0.shopInv[argument1,3];
        obj_Player.inventory[i,4] = argument0.shopInv[argument1,4];
        obj_Player.inventory[i,5] = argument0.shopInv[argument1,5];
        obj_Player.inventory[i,6] = argument0.shopInv[argument1,6];
        i = obj_Player.maxInvSlots;
        gotItem = true;
    }
}

return gotItem; //This returns a valeu that says if the player got an item. 
