/*  This script displays a text box! This script checks if there's a box already there. If so, the existing
    box is destroyed and a new one with the new message is displayed. It MUST be like this. The placement of the 
    box depends if the player is in a battle!
    Arg0 = sentence;
*/
if(instance_exists(obj_textBox)){
    with(obj_textBox){
        instance_destroy();
    }
}
var xPlace = 0;
var yPlace = 0;
if(global.inBattle == true){
    xPlace = 200;
    yPlace = 364;
    var text = instance_create(xPlace,yPlace,obj_textBox);
    text.height = 120;
    text.width = 450;
    text.message = argument0;
}
else{
    var text = instance_create(xPlace,yPlace,obj_textBox);
    text.message = argument0;
    text.alarm[0] = 120;
}
