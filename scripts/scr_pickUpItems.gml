///This script runs whenthe player needs to pick up an item.
var gotItem = false;
for(i = 0; i < obj_Player.maxInvSlots; i += 1){
    if(obj_Player.inventory[i,0] == "" ){    //if that slot is nothing;
        obj_Player.inventory[i,0] = argument0.name;
        obj_Player.inventory[i,1] = argument0.desc;
        obj_Player.inventory[i,2] = argument0.effectOrPow;
        obj_Player.inventory[i,3] = argument0.sellBuyPrice;
        obj_Player.inventory[i,4] = argument0.typeOfItem;
        obj_Player.inventory[i,5] = argument0.sprite_index;
        obj_Player.inventory[i,6] = argument0.origItemID;
        argument0.gotten = true;
        if(global.inBattle == false){
            script_execute(scr_textBox,"Obtained " + argument0.name + "!");
        }
        else{
            global.messageOutput = global.messageOutput + "Obtained " + argument0.name + "! ";
        }
        i = obj_Player.maxInvSlots;
        gotItem = true;
    }
}

return gotItem; //This returns a valeu that says if the player got an item. 
