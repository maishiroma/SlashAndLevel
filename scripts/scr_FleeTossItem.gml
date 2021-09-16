///This only executes during the running away action. 
//Identrical to the other toss option, except has another parameter and there's no instance to destroy

//arg0 = the item name, arg1 = the object's identity to avoid tossing out similar items, arg2 = type of weapon

for(i = 0; i < obj_Player.maxInvSlots; i++){
    if(obj_Player.inventory[i,0] == ""){    continue;   }
    if(obj_Player.inventory[i,0] == argument0 && obj_Player.inventory[i,6] == argument1){
         if(argument2 == "weapon"){
            if(obj_Player.equippedWeapon == argument0 && obj_Player.inventory[i,6] == argument1){
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
        i = obj_Player.maxInvSlots;
    }
}
