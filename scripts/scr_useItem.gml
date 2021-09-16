///Depending on the item type,this script can do various actions!

//weapon items will be equipped to you
//healing itemswill heal you if you aren't full health
//effect itemswill yield immediate results

//heal and effect items will activate the tossItem script once their effect is done.

//arg0 = item, arg1 = id of said item

var type = argument0.typeOfItem;
switch(type){
    case "weapon":
        obj_Player.equippedWeapon = argument0.name;
        obj_Player.origWeapPow = argument0.effectOrPow;
        obj_Player.attWithWeaponPow = obj_Player.origWeapPow + (obj_Player.attPow * 10);
        obj_Player.weaponID = argument0.origItemID;
        break;
    case "heal":
        if(obj_Player.currHealth < obj_Player.maxHealth){
            if(obj_Player.currHealth + argument0.effectOrPow > obj_Player.maxHealth){
                obj_Player.currHealth = obj_Player.maxHealth;
            }
            else{
                obj_Player.currHealth = obj_Player.currHealth + argument0.effectOrPow;
            }
            script_execute(scr_tossItem,argument0,argument1);
            break;
        }
        else{
            break;
        }
    case "effect":
        /*  Depends on the effect. 
            If it's a level up, you increase the player's level.
            A stat boost, determine it here. 
            Don't forget to discard it!
        */
        if(argument0.effectOrPow == "level"){
            obj_Player.currExp = obj_Player.expToNextLevel;
            script_execute(scr_LevelUp,obj_Player,true);
        }
        else if(argument0.effectOrPow == "power1"){
            obj_Player.attPow += 1;
            script_execute(scr_textBox,"The item made you feel even stronger! Now your base power is " + string(obj_Player.attPow) + "!");
        }
        else if(argument0.effectOrPow == "health1"){
            obj_Player.maxHp += 10;
            script_execute(scr_textBox,"The item made you feel even beefier! Now your max HP is " + string(obj_Player.maxHp) + "!");
        }
        script_execute(scr_tossItem,argument0,argument1);
        break;
}
