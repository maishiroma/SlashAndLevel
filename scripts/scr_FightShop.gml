/*  IF the player selects this, a number between 0-10 will roll. If it's 8-10, the 
    player will be sucessful and gaina free item which will be immediatly 
    placed intheir bag. IF their inventory is full...they will just get cash. If 
    the number is less than 8, the player will receivem mortal damage and the shop 
    will dissapear.  

    arg0 = shop object; arg1 = the player    
*/

var chance = script_execute(scr_ranNumbs,10);
if(chance >= 8){
    global.messageOutput = global.messageOutput + "You suucessfully knocked the shop keeper out cold! ";
    var length = script_execute(scr_ranNumbs,array_height_2d(argument0.shopInv));
    while(length >= array_height_2d(argument0.shopInv)){
        length = script_execute(scr_ranNumbs,array_height_2d(argument0.shopInv));
    }
    global.messageOutput = global.messageOutput + "You managed to salvage a " + argument0.shopInv[length,0] + "! ";
    var gotIt = script_execute(scr_FightShopWin,argument0,length);
    if(gotIt == false){
        global.messageOutput = global.messageOutput + "Wait..the player is full up! Obtained $" + string(2* argument0.shopInv[length,3]) + " instead! " ;
        argument1.currMoney = argument1.currMoney + (2*argument0.shopInv[length,3]);
    }
}
else{
    global.messageOutput = global.messageOutput + "The shop keeper clobbered the player and left grumbling! The player took mortal damage! ";
    argument1.currHealth = argument1.currHealth - (argument1.maxHealth/2);
}
with(argument0){
    instance_destroy();
}
script_execute(scr_textBox,global.messageOutput);
