///This makes all of the enemies and items room to be destroyed.
for(i = 0; i < instance_number(obj_Item); i++){
    var curr = instance_find(obj_Item,i);
    show_message("Found item " + string(i));
    with(curr){
        instance_destroy();
    }
}

for(i = 0; i < instance_number(obj_Enemy);i++){
    var curr = instance_find(obj_Enemy,i);
    show_message("Found enemy " + string(i));
    with(curr){
        instance_destroy();
    }
}

