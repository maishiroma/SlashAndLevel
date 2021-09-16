///Controls how an enemy moves around the field.
//arg0 is the enemy

random_set_seed(randomize());
argument0.hsp = script_execute(scr_ranNumbs,10);
argument0.vsp = script_execute(scr_ranNumbs,10);
var negH = script_execute(scr_ranNumbs,2);
var negV = script_execute(scr_ranNumbs,2);

if(negH < 0){
    hsp = -hsp;
}
if(negV < 0){
    vsp = -vsp;
}

repeat(30){
    argument0.x = script_execute(scr_HorizontalCollision,argument0);
    argument0.y = script_execute(scr_VerticalCollision,argument0);
}

argument0.canMove = true;
