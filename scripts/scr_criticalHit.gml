/*  This script greatly boosts the character's power by 2x if a number from 0-100 is divisable by 7
    
    arg0 = character getting the benefit;   arg1 = the character receiving it. 
*/

var rlucky = script_execute(scr_ranNumbs,100) / 7;
if(rlucky == 0){
    var newDamage = argument0.attWithWeaponPow*2;
    //script_execute(scr_textBox,"It was a critical hit! The opoosing side took a whooping " + string(newDamage) + " damage!");
    global.messageOutput = global.messageOutput + "It was a critical hit! The opoosing side took a whooping " + string(newDamage) + " damage! ";
    argument1.currHealth = argument2.currHealth - newDamage;
    return true;
}
else{
    return false;
}
