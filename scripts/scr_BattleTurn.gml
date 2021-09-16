///This script takes care of a battle turn in the game! 
/* First, a random number is generated from 1-10. Any number below 6 means the player moves first. All other numbers
*  make the enemy move first. After one side moves, the opposing side moves. Damage is calculated by subtracting
*  the power of the character with their weapon to the target's health. Death of a character is handled in their
*  own step function. After both sides moved, the battle menu options show again. 
*  Arg0 = the player, Arg1 = the enemy, Arg2 = the battle mode object
*/

//Random number to determine order
var turnOrder = script_execute(scr_ranNumbs,10);
var iteration = 2;          //This is used to keep track whose turn is it to move.
var playerMoved = false;    //this variable determins the order of the code
var spriteAnimate = false;  //controls the animation length of an attack
var crit = false;              //checks if the character landed a critical hit.        
if(turnOrder <= 6){
    playerMoved = true;
}
//To account for any animations during attacking, each side has a time frame of 5 seconds in game for their movement
while(iteration > 0){
    //First, a check if a character did a critical hit is calculated. 
    if(argument2.alreadyMoved == true){  //if the player already did an action
        global.messageOutput = global.messageOutput + "The " + argument1.characterName + " busted the player! ";
        crit = script_execute(scr_criticalHit,argument1,argument0);
        if(crit == false){
            global.messageOutput = global.messageOutput + "The player took " + string(argument1.attWithWeaponPow) + " damage! ";
            argument0.currHealth = argument0.currHealth - argument1.attWithWeaponPow;
        }
        playerMoved = true;
        iteration -= 2;
        argument2.alreadyMoved = false;
    }
    else{
        if(playerMoved == false){
            global.messageOutput = global.messageOutput + "The " + argument1.characterName + " busted the player! ";
            crit = script_execute(scr_criticalHit,argument1,argument0);
            if(crit == false){
                global.messageOutput = global.messageOutput + "The player took " + string(argument1.attWithWeaponPow) + " damage! ";
                argument0.currHealth = argument0.currHealth - argument1.attWithWeaponPow;
            }
            playerMoved = true;
            iteration -= 1;
            if(argument0.currHealth <= 0){  iteration -= 1;    }   //if the enemy did a killing blow, you can't attack
        }
        else{
            global.messageOutput = global.messageOutput + "The player charged at the foe! ";
            crit = script_execute(scr_criticalHit,argument0,argument1);
            if(crit == false){
                global.messageOutput = global.messageOutput + "The " + argument1.characterName + " took " + string(argument0.attWithWeaponPow) + " damage! ";
                argument1.currHealth = argument1.currHealth - argument0.attWithWeaponPow;
            }
            playerMoved = false;
            iteration -= 1;
            if(argument1.currHealth <= 0){  iteration -= 1;    }   //if you did a killing blow, the enemy can't move
        }
    } 
}
//After the actions are done, the menu reappears
if(argument1.currHealth >= 0 && argument0.currHealth >= 0){
    script_execute(scr_textBox,global.messageOutput);
}
argument2.displayOptions = true;
