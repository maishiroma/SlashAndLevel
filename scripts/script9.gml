//Horizontal Collision Handeling and Slope Collision
        if(place_meeting(x+hsp,y,obj_SuperClassWall)){
            while(!place_meeting(x+sign(hsp),y,obj_SuperClassWall)){
                x += sign(hsp);
            }
            hsp = 0;
        }
        x += hsp;
           
        //Vertical Collision Handeling
        if(place_meeting(x,y+vsp,obj_SuperClassWall)){
           while(!place_meeting(x,y+sign(vsp),obj_SuperClassWall)){
               y += sign(vsp);
           }
           vsp = 0;
        }
        y += vsp;
