/*  Displays the inventory of the shop. Similar to the player display inventory. 
    arg0 = x value; arg1 = y value, arg2 = shop object
*/
var width = room_width/2;
var height = 80;
for(i = 0; i < 3; i++){
    var currItem = instance_create(width+argument0,height+argument1+(30*i),obj_ShopItem);
    currItem.name = argument2.shopInv[i,0];
    currItem.desc = argument2.shopInv[i,1];
    currItem.effectOrPow = argument2.shopInv[i,2];
    currItem.sellBuyPrice = argument2.shopInv[i,3];
    currItem.typeOfItem = argument2.shopInv[i,4];
    currItem.sprite_index = argument2.shopInv[i,5];
    currItem.origItemID = argument2.shopInv[i,6];
    currItem.image_xscale = 0.7;
    currItem.image_yscale = 0.7;
    currItem.shopItem = true;
}

