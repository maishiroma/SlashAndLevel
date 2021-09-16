///This creates the icons and objects representing items that the player has. 
//arg0 = x mod, arg1 = y mod
// This returns a number that's used for the obj_battle inventory to keep track if an action is done.
var width = room_width/2;
var height = (room_height/2) - 60;
var numOfItems = 0;
for(i = 0; i < obj_Player.maxInvSlots; i++){
    if(obj_Player.inventory[i,0] != ""){
        var currItem = instance_create(width+argument0,height+argument1+(30*i),obj_InvItem);
        currItem.name = obj_Player.inventory[i,0];
        currItem.desc = obj_Player.inventory[i,1];
        currItem.effectOrPow = obj_Player.inventory[i,2];
        currItem.sellBuyPrice = obj_Player.inventory[i,3];
        currItem.typeOfItem = obj_Player.inventory[i,4];
        currItem.sprite_index = obj_Player.inventory[i,5];
        currItem.origItemID = obj_Player.inventory[i,6];
        currItem.image_xscale = 0.7;
        currItem.image_yscale = 0.7;
        numOfItems++;
    }
}

return numOfItems;
