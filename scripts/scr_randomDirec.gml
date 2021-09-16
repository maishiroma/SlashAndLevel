//This returns a random direction that's either 0,45,90,135,180,225,270,315,360.
direc[0] = 0;
for(i = 0; i < 9; i++){
    direc[i] = i*45;
}
random_set_seed(randomize());
var length = script_execute(scr_ranNumbs,array_length_1d(direc));
while(length >= array_length_1d(direc)){
    length = script_execute(scr_ranNumbs,array_length_1d(direc));
}
return direc[length];
