///This script handles the player running away from the fight

/*When the player selects this, a random number will roll from 0 and 1. If it's a 1, the plaer
* can sucesdfully run away from thr fight. Else, nothing happens and the player loses their
* turn. If the player runs away, they will lose 1/5 of their cash, if they have any, and/or
* one of their items The chance is higher if they are carrying a lot of items.
* 
* arg0 = player object; arg1 = battleMode object arg2 = enemy object
*/

var chance = script_execute(scr_ranNumbs,1);
if(chance == 0){
    global.messageOutput = global.messageOutput + "Can't escape! ";
}
else{
    global.messageOutput = global.messageOutput + "Sucess! ";
    var origG = argument0.currMoney;
    argument0.currMoney = round(argument0.currMoney - (argument0.currMoney * 0.2));
    global.messageOutput = global.messageOutput + "You dropped $" + string(origG - argument0.currMoney) + "! ";
    var length = script_execute(scr_ranNumbs,argument0.maxInvSlots);
    while(length >= argument0.maxInvSlots){
        length = script_execute(scr_ranNumbs,argument0.maxInvSlots);
    }
    if(argument0.inventory[length,0] != ""){
        global.messageOutput = global.messageOutput + "You dropped " + argument0.inventory[length,0] + "! ";
        script_execute(scr_FleeTossItem,argument0.inventory[length,0],argument0.inventory[length,6],argument0.inventory[length,4]);
    }
    var curr = instance_find(obj_Enemy,0);
    with(curr){
        x = currentX;
        y = currentY;
    }
    script_execute(scr_textBox,global.messageOutput);
    obj_textBox.alarm[0] = 120;
    room_goto(testRoom);
    argument0.x = argument0.currentX;
    argument0.y = argument0.currentY;
    global.inBattle = false;
    argument0.flee = true;
    argument0.alarm[0] = argument0.fleeTime;
}
