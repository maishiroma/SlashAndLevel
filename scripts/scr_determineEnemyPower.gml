///This determines how strong an enemy attack is!

availPow[0] = 10;
availPow[1] = 20;
availPow[2] = 30;
availPow[3] = 40;
availPow[4] = 50;
availPow[5] = 60;

var length = script_execute(scr_ranNumbs,array_length_1d(availPow));
while(length >= array_length_1d(availPow)){
    length = script_execute(scr_ranNumbs,array_length_1d(availPow));
}
return availPow[length];
