/*  This script takes care of all the actions in spawning in a shop keeper in the room. In order for one
    to appear, a random number will be generated from 0-10. If the number is 7-10, all of the enemies
    will disspaear in the room and instead a shop keeper will be spawned in instead. 
    
    This script will also handle what items the shop keeper will have.
    
    Argument0 = the number that got the shop chance.
*/

var xCord = 192;
var yCord = 64; 
/*  Shop Database. All availabe items that can be found in shops are here. These items are signifigantly
    stronger than items found randomely. Use same naming convention. 
    Format: (i is a number that's not used yet)
    [i,0] = name of item (the variable name is "name")
    [i,1] = description of item (the variable name is "desc")
    [i,2] = the power or effect number of said item (the variable name is "effectOrPow")
    [i,3] = the shop price of said item. (Selling price is this halved) (the variable name is "sellBuyPrice")
    [i,4] = type of item. Either "weapon", "heal", or "effect" (the variable name is "typeOfItem")
    [i,5] = sprite of item
*/
itemList[0,0] = "";
for(i = 0; i < 10; i++){ //The 3 is the number of items in the database. This is flexible
    for(j = 0; j < 6; j++){
        itemList[i,j] = "";
    }
}
itemList[0,0] = "Lemonade";
itemList[0,1] = "A sweet, yet addictive beverage. Restores 80 HP.";
itemList[0,2] = 80;
itemList[0,3] = 80;
itemList[0,4] = "heal";
itemList[0,5] = spr_HealI;
itemList[1,0] = "Onion Rings";
itemList[1,1] = "A batch of freshly backed morsals! Restores 120 HP.";
itemList[1,2] = 120;
itemList[1,3] = 120;
itemList[1,4] = "heal";
itemList[1,5] = spr_HealI;
itemList[2,0] = "Royal Milk";
itemList[2,1] = "Creamy goodness only for royalty! Restores 200 HP.";
itemList[2,2] = 200;
itemList[2,3] = 200;
itemList[2,4] = "heal";
itemList[2,5] = spr_HealI;
itemList[3,0] = "Roast Beef";
itemList[3,1] = "A portabal dinner! Restores 270 HP.";
itemList[3,2] = 270;
itemList[3,3] = 270;
itemList[3,4] = "heal";
itemList[3,5] = spr_HealI;
itemList[4,0] = "Cutlet";
itemList[4,1] = "A crispy pork dish. Restores 310 HP.";
itemList[4,2] = 310;
itemList[4,3] = 310;
itemList[4,4] = "heal";
itemList[4,5] = spr_HealI;
itemList[5,0] = "Butcher Knife";
itemList[5,1] = "A meat slicer. Good for cutting pork! Power: 150";
itemList[5,2] = 150;
itemList[5,3] = 150;
itemList[5,4] = "weapon";
itemList[5,5] = spr_WeaponI;
itemList[6,0] = "Chopper";
itemList[6,1] = "A special glove for KARATE CHOP ACTION! Pow: 250";
itemList[6,2] = 250;
itemList[6,3] = 250;
itemList[6,4] = "weapon";
itemList[6,5] = spr_WeaponI;
itemList[7,0] = "Thundage";
itemList[7,1] = "A mystical lightening rod...sword I mean. Pow: 300";
itemList[7,2] = 300;
itemList[7,3] = 300;
itemList[7,4] = "weapon";
itemList[7,5] = spr_WeaponI;
itemList[8,0] = "Muscle Juice";
itemList[8,1] = "A tonic that increases your power! Pow + 1";
itemList[8,2] = "power1";
itemList[8,3] = 3000;
itemList[8,4] = "effect";
itemList[8,5] = spr_EffectI;
itemList[9,0] = "Stamina Sauce";
itemList[9,1] = "Awesome sauce! Increases your max HP! MaxHp + 10";
itemList[9,2] = "health1";
itemList[9,3] = 3000;
itemList[9,4] = "effect";
itemList[9,5] = spr_EffectI;
 
switch(argument0){
     case 7: break;
     case 8:
         xCord = 416;
         yCord = 64;
         break;
     case 9:
         xCord = 192;
         yCord = 352;
     case 10:
         xCord = 416;
         yCord = 352;
}
var thisShop = instance_create(xCord,yCord,obj_Shop);
while(obj_Player.currLevel > thisShop.currLevel){
    thisShop.currLevel += 1;
}
thisShop.shopBaseValue = thisShop.currLevel * script_execute(scr_ranNumbs,200);
for(i = 0; i < 3; i += 1){
     var length = script_execute(scr_ranNumbs,array_height_2d(itemList));
     while(length >= array_height_2d(itemList)){
        length = script_execute(scr_ranNumbs,array_height_2d(itemList));
     }
     var temp = instance_create(0,0,obj_Item);
     thisShop.shopInv[i,0] = itemList[length,0];
     thisShop.shopInv[i,1] = itemList[length,1];
     thisShop.shopInv[i,2] = itemList[length,2];
     thisShop.shopInv[i,3] = itemList[length,3] + thisShop.shopBaseValue;
     thisShop.shopInv[i,4] = itemList[length,4];
     thisShop.shopInv[i,5] = itemList[length,5];
     thisShop.shopInv[i,6] = temp;
     with(temp){ instance_destroy();   }
 }
