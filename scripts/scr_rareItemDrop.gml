/*  This script runs only of the enemy is rare and a certain number range is met!
    One item will be given to the player if its inventory is not full. IF it is...you can't get it.
*/

rareItem[0,0] = "";
for(i = 0; i < 10; i++){ //The 3 is the number of items in the database. This is flexible
    for(j = 0; j < 6; j++){
        rareItem[i,j] = "";
    }
}
/*  The rare item database. Naming conventiom is same as a normal item
        [i,0] = name of item (the variable name is "name")
        [i,1] = description of item (the variable name is "desc")
        [i,2] = the power or effect number of said item (the variable name is "effectOrPow")
        [i,3] = the shop price of said item. (Selling price is this halved) (the variable name is "sellBuyPrice")
        [i,4] = type of item. Either "weapon", "heal", or "effect" (the variable name is "typeOfItem")
        [i,5] = sprite of item
        {i,6} = original Item ID (the variable name is "origItemID")
*/
rareItem[0,0] = "eBar";
rareItem[0,1] = "A light snack. Good and full of energy! Restores 350 HP.";
rareItem[0,2] = 350;
rareItem[0,3] = 400;
rareItem[0,4] = "heal";
rareItem[0,5] = spr_HealI;
rareItem[1,0] = "Fish Fillet";
rareItem[1,1] = "A nicely prepped plate of battered fish. Restores 650 HP.";
rareItem[1,2] = 650;
rareItem[1,3] = 700;
rareItem[1,4] = "heal";
rareItem[1,5] = spr_HealI;
rareItem[2,0] = "Tsunder Tonic";
rareItem[2,1] = "Where did this come from? Restores ALL HP!";
rareItem[2,2] = 999999999;
rareItem[2,3] = 9000;
rareItem[2,4] = "heal";
rareItem[2,5] = spr_HealI;
rareItem[3,0] = "Elixup";
rareItem[3,1] = "Descending from the heavens, drink to levels up immediatly!";
rareItem[3,2] = "level";
rareItem[3,3] = 9000;
rareItem[3,4] = "effect";
rareItem[3,5] = spr_EffectI;
rareItem[4,0] = "Wonder Cake";
rareItem[4,1] = "A cake that radiates power to greatly buff your HP or power!";
rareItem[4,2] = "ranGrow";
rareItem[4,3] = 90000;
rareItem[4,4] = "effect";
rareItem[4,5] = spr_EffectI;
rareItem[5,0] = "Gustar";
rareItem[5,1] = "A paper fan. This one kicks up a storm! Power: 400";
rareItem[5,2] = 400;
rareItem[5,3] = 500;
rareItem[5,4] = "weapon";
rareItem[5,5] = spr_WeaponI;
rareItem[6,0] = "Blades of Chaos";
rareItem[6,1] = "Is this from another universe? Looks pretty brutal. Pow: 450";
rareItem[6,2] = 450;
rareItem[6,3] = 600;
rareItem[6,4] = "weapon";
rareItem[6,5] = spr_WeaponI;
rareItem[7,0] = "Smastar";
rareItem[7,1] = "A rod that rains down pain in the form of stars! Pow: 500";
rareItem[7,2] = 500;
rareItem[7,3] = 700;
rareItem[7,4] = "weapon";
rareItem[7,5] = spr_WeaponI;
rareItem[8,0] = "Flamesickle";
rareItem[8,1] = "Fire and ice merge together to form a fearsome blade. Pow: 550";
rareItem[8,2] = 550;
rareItem[8,3] = 800;
rareItem[8,4] = "weapon";
rareItem[8,5] = spr_WeaponI;
rareItem[9,0] = "Omega Mallet";
rareItem[9,1] = "The true ultima! The power of the universe is yours! Pow: 600 ";
rareItem[9,2] = 600;
rareItem[9,3] = 10000;
rareItem[9,4] = "weapon";
rareItem[9,5] = spr_WeaponI;

var length = script_execute(scr_ranNumbs,array_height_2d(rareItem));
while(length >= array_height_2d(rareItem)){
   length = script_execute(scr_ranNumbs,array_height_2d(rareItem));
}
global.messageOutput = global.messageOutput + "Oh? There's something clearing from the smoke...";
var rItem = instance_create(x,y,obj_Item);
rItem.name = rareItem[length,0];
rItem.desc = rareItem[length,1];
rItem.effectOrPow = rareItem[length,2];
rItem.sellBuyPrice = rareItem[length,3];
rItem.typeOfItem = rareItem[length,4];
rItem.sprite_index = rareItem[length,5];
rItem.origItemID = rItem;
rareItem[length,6] = rItem.origItemID;
var gotIt = script_execute(scr_pickUpItems,rItem);
if(gotIt == false){
    global.messageOutput = global.messageOutput + "The item vanished! Your inventory must be full! ";
}

