///This script runs when the player wants to use an item. 

/* If the player selects this option, a simplified Pause Menu will be displayed. From here, the player can ONLY
 * select healing items and effect items. Nothing else will be shown. If an item was used, the player's turn will end.
 * Otherwose, the player can exit out of the screen to return to the main screen.
 * Arg0 = player; Arg1 = Battle Mode Object
 */

var menu = instance_create(room_width/2,room_height/2,obj_BattleInv);
instance_create(room_width/2+250,room_height/2 - 100,obj_exitMenu);
