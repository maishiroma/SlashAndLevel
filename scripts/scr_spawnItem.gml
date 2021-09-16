///This script chooses what kind of item is spawned.

//Sets up the array and fills it.
fieldItem[0,0] = "";
for(i = 0; i < 6; i++){ //The 3 is the number of items in the database. This is flexible
    for(j = 0; j < 6; j++){
        fieldItem[i,j] = "";
    }
}
//The item database for items spawned on the floor
/*  Format: (i is a number that's not used yet)
        [i,0] = name of item (the variable name is "name")
        [i,1] = description of item (the variable name is "desc")
        [i,2] = the power or effect number of said item (the variable name is "effectOrPow")
        [i,3] = the shop price of said item. (Selling price is this halved) (the variable name is "sellBuyPrice")
        [i,4] = type of item. Either "weapon", "heal", or "effect" (the variable name is "typeOfItem")
        [i,5] = sprite of item
        {i,6} = original Item ID (the variable name is "origItemID")
*/
fieldItem[0,0] = "Ramen";                    
fieldItem[0,1] = "A high calorie, but filling lunch. Restores 40 HP.";    
fieldItem[0,2] = 40;                         
fieldItem[0,3] = 40;                          
fieldItem[0,4] = "heal";                   
fieldItem[0,5] = spr_HealI;                
fieldItem[1,0] = "Pickles";
fieldItem[1,1] = "A crunchy, refreshing treat. Restores 30 HP.";
fieldItem[1,2] = 30;
fieldItem[1,3] = 30;
fieldItem[1,4] = "heal";
fieldItem[1,5] = spr_HealI;      
fieldItem[2,0] = "Crtea";
fieldItem[2,1] = "A drink that gives off a green glow. Restores 20 HP.";
fieldItem[2,2] = 20;
fieldItem[2,3] = 20;
fieldItem[2,4] = "heal";
fieldItem[2,5] = spr_HealI;    
fieldItem[3,0] = "Lazer";                    
fieldItem[3,1] = "A tool that allows the user to scortch anyone. Pow: 45";    
fieldItem[3,2] = 45;                         
fieldItem[3,3] = 45;                          
fieldItem[3,4] = "weapon";                   
fieldItem[3,5] = spr_WeaponI;                
fieldItem[4,0] = "Katana";
fieldItem[4,1] = "A lightweight sword that looks strangely fake. Pow: 30";
fieldItem[4,2] = 30;
fieldItem[4,3] = 30;
fieldItem[4,4] = "weapon";
fieldItem[4,5] = spr_WeaponI;      
fieldItem[5,0] = "Hammer";
fieldItem[5,1] = "A lame version of the fabled Mallet. Pow: 50";
fieldItem[5,2] = 50;
fieldItem[5,3] = 50;
fieldItem[5,4] = "weapon";
fieldItem[5,5] = spr_WeaponI;  

//This part finds an enpty spot for the spawn and places it there.
var limit = 2;
while(limit > 0){
    if(script_execute(scr_ranNumbs,3) != 0){
        //This first part finds a spot onthe mapo that is NOT occupied. 
        var xLoc = 0;
        var yLoc = 0;
        found = false;
        while(found == false){
            xLoc = script_execute(scr_ranNumbs,room_width);
            yLoc = script_execute(scr_ranNumbs,room_height);
            if(place_empty(xLoc,yLoc)){
                found = true;
            }
        }
        //Now it chooses the item type and spawns it in the room. 
        var length = script_execute(scr_ranNumbs,array_height_2d(fieldItem));
        while(length >= array_height_2d(fieldItem)){
            length = script_execute(scr_ranNumbs,array_height_2d(fieldItem));
        }
        var this = instance_create(xLoc,yLoc,obj_Item);
        this.name = fieldItem[length,0];
        this.desc = fieldItem[length,1];
        this.effectOrPow = fieldItem[length,2];
        this.sellBuyPrice = fieldItem[length,3];
        this.typeOfItem = fieldItem[length,4];
        this.sprite_index = fieldItem[length,5];
        this.origItemID = this;
        fieldItem[length,6] = this.origItemID;
    }
    limit--;
}
