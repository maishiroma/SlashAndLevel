/*  This is the actions that the shop will do when you interact with the items in
    here. Left clicking is the action toeither buy or sell an item. 
    
    arg0 = shop item or your item
*/

//A quick check to see if the item is a shop item
if(argument0.shopItem == true){
    //if it is, the shop item is transfered to your inventory if your inventory
    //is not full and you have sifficient funds. 
    if(obj_Player.currMoney - argument0.sellBuyPrice >= 0){
        var got = script_execute(scr_pickUpItems,argument0);
        if(got == true){
            obj_Player.currMoney = obj_Player.currMoney - argument0.sellBuyPrice;
        }
        else{
            script_execute(scr_textBox,"Sorry! No more space in inventory! Clear it!");
        }
    }
    else{
        script_execute(scr_textBox,"You lack funds!");
    }
}
else{
    obj_Player.currMoney = obj_Player.currMoney + round(argument0.sellBuyPrice/2);
    script_execute(scr_tossItem,argument0,argument0.origItemID);
}
