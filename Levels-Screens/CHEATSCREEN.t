%CHEATSCREEN
%Sets the screen to dimensions of 1006X600
View.Set ("graphics:1006;660,nobuttonbar")
loop
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 18)
    %  Text
    Font.Draw ("ENTER YOUR CHEAT CODE", 80, 470, font8, 53)
    Font.Draw ("Type 'back' to go back to menu", 17, 630, font6, brightred)
    drawbox (300, 455, 700, 380, 53)
    %Locates the text input and changes the colour of text
    locate (4, 9)
    colourback (18)
    colour (white)
    View.Update
    %Gets the user to input a word
    get cheatword
    % If the user enters the cheat "Level1" then it will start
    % the level 1 file.
    if cheatword = "level1" then
	include "LEVEL1.T"
	% If the user enters the cheat "Level1boss" then it will start
	% the level 1 boss file.
    elsif cheatword = "level1boss" then
	include "LEVEL1BOSS.T"
	% If the user enters the cheat "Level2" then it will start
	% the level 2 file.
    elsif cheatword = "level2" then
	include "LEVEL2.T"
	% If the user enters the cheat "Level2boss" then it will start
	% the level 2 boss file.
    elsif cheatword = "level2boss" then
	include "LEVEL2BOSS.T"
	% If the user enters the cheat "Level3" then it will start
	% the level 3 file.
    elsif cheatword = "level3" then
	include "LEVEL3.T"
	% If the user enters the cheat "Level3boss" then it will start
	% the level 3boss file.
    elsif cheatword = "level3boss" then
	include "LEVEL3BOSS.T"
	% If the user enters the cheat "victory" then it will start
	% the victory screen file.
    elsif cheatword = "victory" then
	include "VICTORYSCREEN.T"
	%If the user enters the cheat "Luffy" then it will
	%unlock the character luffy.
    elsif cheatword = "luffy" then
	luffyselect := true
	Font.Draw ("Character Unlocked", 400, 280, font6, brightred)
	delay (1000)
	%If the cheat word is "back" then it will exit the loop and go
	%back to the main menu
    elsif cheatword = "back" then
	exit
    else
    % If the cheat word is not any of the listed then it will show
    % the incorect code.
	Font.Draw ("Incorrect Code", 417, 280, font6, brightred)
	delay (1000)
    end if
end loop
%Will go the main menu procedure
mainmenu
