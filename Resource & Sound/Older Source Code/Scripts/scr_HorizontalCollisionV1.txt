///This handy code takes care of horizontal colisions on the map.
//arg0 is the object calling this

var currX = argument0.x;
var currY = argument0.y;
var hsp = argument0.hsp;

//Horizontal Collision Handeling
if(place_meeting(currX+hsp,currY,obj_SuperClassWall)){
    while(!place_meeting(currX+sign(hsp),currY,obj_SuperClassWall)){
        currX += sign(hsp);
    }
    hsp = 0;
}
return hsp;
