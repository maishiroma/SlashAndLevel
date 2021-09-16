///This handy code takes care of all colisions on the map.
//arg0 is the object calling this

var currX = argument0.x;
var currY = argument0.y;
var hsp = argument0.hsp;
var vsp = argument0.vsp;

//Horizontal Collision Handeling and Slope Collision
if(place_meeting(currX+hsp,currY,obj_SuperClassWall)){
    while(!place_meeting(currX+sign(hsp),currY,obj_SuperClassWall)){
        currX += sign(hsp);
    }
    hsp = 0;
}
currX += hsp;
   
//Vertical Collision Handeling
if(place_meeting(currX,currY+vsp,obj_SuperClassWall)){
   while(!place_meeting(currX,currY+sign(vsp),obj_SuperClassWall)){
       currY += sign(vsp);
   }
   vsp = 0;
}
currY += vsp;
