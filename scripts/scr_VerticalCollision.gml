///This handy code takes care of vertical colisions on the map.
//arg0 is the object calling this

var currX = argument0.x;
var currY = argument0.y;
var vsp = argument0.vsp;

//Vertical Collision Handeling
if(place_meeting(currX,currY+vsp,obj_SuperClassWall)){
   while(!place_meeting(currX,currY+sign(vsp),obj_SuperClassWall)){
       currY += sign(vsp);
   }
   vsp = 0;
}
return vsp;
