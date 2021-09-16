/*  Controls how enemies spawn in the room. This script contains all of the monsters as well as spawning them. 
    This also determins if a shop will spawn.
*/

//First, a number will decide if a shop will spawn. Else, the script will spawn monsters.
var randomChance = script_execute(scr_ranNumbs,10);
if(randomChance >= 7){
    script_execute(scr_spawnShop,randomChance);  
}
else{
    //An enemyData base list will be formed, similar to the item database. 
    for(i = 0; i < 10; i++){ //The only number here implies how many enemies are there. 
        for(j = 0; j < 6; j++){ //The only number here means how many slots of information an enemy can have.
            enemyList[i,j] = "";
        }
    
    }
    /*The enemy database. Refer to below comments for hoe to use. 
        [i,0] = name of enemy (the variable name is "name")
        [i,1] = max health of enemy (the variable name is "maxHp")
        [i,2] = the power of said enemy(the variable name is "attPow")
        [i,3] = the level of said enemy  (the variable name is "currLevel")
        [i,4] = type of enemy. "normal" is normal and "rare" has chance to drops items(the variable name is "characterType")
        [i,5] = sprite of enemy
    */
    enemyList[0,0] = "Bandit";  
    enemyList[0,1] = 60;        
    enemyList[0,2] = 1;         
    enemyList[0,3] = 1;         
    enemyList[0,4] = "normal";  
    enemyList[0,5] = spr_enemy; 
    enemyList[1,0] = "Ghosty";
    enemyList[1,1] = 90;
    enemyList[1,2] = 1;
    enemyList[1,3] = 1;
    enemyList[1,4] = "normal";
    enemyList[1,5] = spr_enemy;
    enemyList[2,0] = "Dueler";
    enemyList[2,1] = 120;
    enemyList[2,2] = 1;
    enemyList[2,3] = 1;
    enemyList[2,4] = "normal";
    enemyList[2,5] = spr_enemy;
    enemyList[3,0] = "Jido";  
    enemyList[3,1] = 150;        
    enemyList[3,2] = 1;         
    enemyList[3,3] = 1;         
    enemyList[3,4] = "normal";  
    enemyList[3,5] = spr_enemy; 
    enemyList[4,0] = "Hedgerog";
    enemyList[4,1] = 180;
    enemyList[4,2] = 1;
    enemyList[4,3] = 1;
    enemyList[4,4] = "normal";
    enemyList[4,5] = spr_enemy;
    enemyList[5,0] = "Mutant";
    enemyList[5,1] = 210;
    enemyList[5,2] = 1;
    enemyList[5,3] = 1;
    enemyList[5,4] = "norma;";
    enemyList[5,5] = spr_enemy;
    enemyList[6,0] = "Jock";  
    enemyList[6,1] = 250;        
    enemyList[6,2] = 1;         
    enemyList[6,3] = 1;         
    enemyList[6,4] = "normal";  
    enemyList[6,5] = spr_enemy; 
    enemyList[7,0] = "Plumbar";
    enemyList[7,1] = 160;
    enemyList[7,2] = 2;
    enemyList[7,3] = 1;
    enemyList[7,4] = "rare";
    enemyList[7,5] = spr_enemy;
    enemyList[8,0] = "Grob";
    enemyList[8,1] = 200;
    enemyList[8,2] = 2;
    enemyList[8,3] = 1;
    enemyList[8,4] = "rare";
    enemyList[8,5] = spr_enemy;
    enemyList[9,0] = "Hooter";  
    enemyList[9,1] = 240;        
    enemyList[9,2] = 2;         
    enemyList[9,3] = 1;         
    enemyList[9,4] = "rare";  
    enemyList[9,5] = spr_enemy; 
    
    //Then, three enemies at random will be choosen to be spawned in the room. 
    var limit = 2;
    while(limit > 0){
        //This first part finds a spot ont he mapo that is NOT occupied. 
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
        //Now it chooses the enemy and spawns it in the room. 
        var length = script_execute(scr_ranNumbs,array_height_2d(enemyList));
        while(length >= array_height_2d(enemyList)){
            length = script_execute(scr_ranNumbs,array_height_2d(enemyList));
        }
        var this = instance_create(xLoc,yLoc,obj_Enemy);
        this.characterName = enemyList[length,0];
        this.maxHealth = enemyList[length,1];
        this.currHealth = this.maxHealth;
        this.attPow = enemyList[length,2];
        this.currLevel = enemyList[length,3];
        this.characterType = enemyList[length,4];
        this.sprite_index = enemyList[length,5];
        this.origWeapPow = script_execute(scr_determineEnemyPower);
        this.attWithWeaponPow = (this.attPow * 10) + this.origWeapPow;
        this.direc = script_execute(scr_randomDirec);
        limit--;
        if(obj_Player.currLevel > this.currLevel){
            script_execute(scr_LevelUp,this,false);
        }
    }
}
