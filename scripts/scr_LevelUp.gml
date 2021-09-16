/*  This script has the sole purpose of handling character leveling up from experience. If the player gains enough experience to meet the threshold to the next level, the player will
    automatically level up, increasing one oftheir stats randomely as well as their level increasing. They will also get a full heal as a bonus. This will be called after a battle, or on the 
    field if the character used an item to level up. If an enemy is called in this, they will get a HP,Pow, and level buff. That's called in the room creation code, to balance out the
    game.
*/
//Arg0 = the character; arg1 = if the character is the player

if(argument1 == true){  //Player level up
    if(argument0.currExp >= argument0.expToNextLevel){   //quick check if the player did level up
        argument0.currLevel += 1;
        global.messageOutput = global.messageOutput + "The player gained a level! WOOHOO! Now at Lv:" + string(argument0.currLevel) + "! ";
        var whichS = script_execute(scr_ranNumbs,2);
        if(whichS > 0){
            argument0.attPow += 2;
            obj_Player.attWithWeaponPow = obj_Player.origWeapPow + (obj_Player.attPow * 10);
            global.messageOutput = global.messageOutput + "The player's base attack went up to " + string(argument0.attPow) + "! ";
        }
        else{
            argument0.maxHealth += 20;
            global.messageOutput = global.messageOutput +"The player's health buffed up to " + string(argument0.maxHealth) + "! " ;
        }
        argument0.currHealth = argument0.maxHealth; //restores player's health
        argument0.expToNextLevel = argument0.expToNextLevel + (argument0.currLevel * 100);
    }
}
else{   //enemy level up
    while(obj_Player.currLevel > argument0.currLevel){  //This makes it so that the enemies are around the same level as the player
        argument0.currLevel += 1;
        argument0.attPow +=1;
        argument0.maxHealth += 10;
        argument0.attWithWeaponPow =  argument0.origWeapPow + (argument0.attPow * 10);
        argument0.currHealth = argument0.maxHealth;
    }
}
