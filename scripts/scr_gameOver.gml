///This simple script takes the player to the game over room

//arg0 = player, arg1 = enemy

if(global.inBattle == true){
    global.messageOutput = global.messageOutput + "Oh no! You're defeated!"
    script_execute(scr_textBox,global.messageOutput);
}
else{
    script_execute(scr_textBox,"Oh no! You're defeated!");
}
audio_stop_music();
argument0.x = room_width/2 + 200;
argument0.y = room_height/2 - 130;
argument0.sprite_index = spr_charF;
argument0.image_alpha = 1;
with(argument1){    instance_destroy();   }
room_goto(gameOver);
