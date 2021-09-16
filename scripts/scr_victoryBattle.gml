///This script handles the player defeating the enemy!

/*When the player defeats the enemy, they will automatically collect the exp and cash dropped by the enemy.
* If the player has enough exp to level up, the level up script will play. Afterwards, the player is sent
* back to the main room, without the enemy obviously. If the enemy dropped an item, the item will
* appear in the enemy's place.
* arg0 = player object; arg1 = battleMode object, arg2 = enemy object
*/

global.messageOutput = global.messageOutput + "You won! The enemy vanished into a puff of smoke! ";
//Experience Gain
//Here, the enemy drops exp depending on their own level and the players
var expMod = (argument0.currLevel * 35) - (argument2.currLevel * 5);
var totalExpE = script_execute(scr_ranNumbs,100) + expMod;
global.messageOutput = global.messageOutput + "You gained " + string(totalExpE) + " exp! ";
argument0.currExp = argument0.currExp + totalExpE;
if(argument0.currExp >= argument0.expToNextLevel){
    script_execute(scr_LevelUp,argument0,true);
}
//Money drop
//Money is determined by level of foe, and a random number generator.
var defCash = script_execute(scr_ranNumbs,100);
while(defCash < 50){    //makes it so that the mon def amount is $50
    defCash = script_execute(scr_ranNumbs,100);
}
defCash = defCash * argument2.currLevel;
global.messageOutput = global.messageOutput + "Earned $" + string(defCash) + " from the enemy! ";
argument0.currMoney = argument0.currMoney + defCash;

//If the enemy is rare, a number is rolled from 0-10. If it's 9-10, you get a rare item!
if(argument2.characterType == "rare"){
    var ran = script_execute(scr_ranNumbs,10);
    if(ran >=9){
        script_execute(scr_rareItemDrop);
    }
}

//The player returns to the main room
script_execute(scr_textBox,global.messageOutput);
obj_textBox.alarm[0] = 300;
room_goto(testRoom);
argument0.x = argument0.currentX;
argument0.y = argument0.currentY;
argument0.defeatedEnemies += 1;
global.inBattle = false;
with(argument2){    instance_destroy();   }
