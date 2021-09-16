///Identical to the scr_tossItem, except it only takes one parameter

for(i = 0; i < obj_Player.maxInvSlots; i++){
    if(obj_Player.inventory[i,0] == ""){    continue;   }
    if(obj_Player.inventory[i,0] == argument0.name && obj_Player.inventory[i,6] == argument1){
         if(argument0.typeOfItem == "weapon"){
            if(obj_Player.equippedWeapon == argument0.name && obj_Player.inventory[i,6] == argument1){
                obj_Player.equippedWeapon = "nothing";
                obj_Player.attWithWeaponPow = 0;
            }
        }
        obj_Player.inventory[i,0] = "";
        obj_Player.inventory[i,1] = "";
        obj_Player.inventory[i,2] = "";
        obj_Player.inventory[i,3] = "";
        obj_Player.inventory[i,4] = "";
        obj_Player.inventory[i,5] = "";
        obj_Player.inventory[i,6] = "";
        with(argument0){
            instance_destroy();
        }
        i = obj_Player.maxInvSlots;
    }
}
