%LEVEL 1 BOSS
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level1bossmusic
%Sets the y and x coordinates of the boss enemy
bossy := 20
bossx := 600
%Gives the boss a set amount of lives
bosslives := 3
%Resets the a counter which is used for various functions
a := 0
%Sets the x and y coordinates of the player
x := 30
y := 20
%Draws the level
level1boss
%Draws text on screen
Font.Draw ("Defeat", 430, 610, font6, black)
Font.Draw ("TURING", 350, 560, font2, 42)
%Draws player and boss on the screen
Pic.Draw (player, x, y, picMerge)
Pic.Draw (tboss, bossx, bossy, picMerge)
%Updates the screen
View.Update
%Delays program for 2 seconds
delay (2000)
%LEVEL 1 BOSS
%First loop is there for the lives system
loop
    %Sets the initial x and y and vely of the character
    vely := 0
    x := 30
    y := 20
    %Second loop is there for actual gameplay
    loop
	%Draws the character
	Pic.Draw (player, x, y, picMerge)
	%Only draws the character if its lives are above
	%0
	if bosslives > 0 then
	    Pic.Draw (tboss, bossx, bossy, picMerge)
	    View.Update
	end if
	%Updates screen
	View.Update
	%Clears the screen
	cls
	%Draws the level
	level1boss
	%This piece of code occurs when the boss has been defeated
	%it opens the door and places a block for the character
	%to get out of the arena.
	if bosslives = 0 then
	    Font.Draw ("Congratulations", 400, 470, font6, black)
	    Font.Draw ("You have learned Turing!", 350, 440, font6, black)
	    %helpingbox
	    drawfillbox (650, 20, 696, 60, 42)
	    %opening door
	    drawfillbox (976, 20, 1006, 130, 29)
	    %Music is also played and the a counter is used to make
	    % it so it only gets played once throughout
	    %the whole loop
	    a += 1
	    if a = 1 then
		fork bossdefeatmusic
	    end if
	end if
	%GRAVITY
	%If the player isn't on the ground anymore this piece of code will run
	if not groundheight then
	    %subtracts gravity from vely when player is in the air
	    vely -= gravity
	    %adds vely to y which changes player's position vertically
	    y += vely
	end if
	%CONTROLS
	% The program will read the keys being pressed.
	Input.KeyDown (keys)
	% If the key up arrow and they are on the ground it will allow them to jump.
	if keys (KEY_UP_ARROW) and groundheight = true then
	    vely := jumpspeed
	    y += vely
	end if
	% If the key right arrow is pressed and they arent at maxx they will move to the right.
	if keys (KEY_RIGHT_ARROW) and x + 15 not= maxx then
	    velx := runspeed
	    x += velx
	    % If the key left arrow is pressed and they arent at 0 they will move to the left.
	elsif keys (KEY_LEFT_ARROW) and x not= 0 then
	    velx := -runspeed
	    x += velx
	else
	    velx := 0
	end if
	%HIT DETECTION FOR SIDES AND HEAD
	% View.WhatDotColor is a command that determines the colour of
	% a pixel. In this case when the characters colour hits the colour of
	% 42 then it will oppose the movement of the character to stop them
	%from going through a block.
	if View.WhatDotColor (x + 20, y + 20) = 42 then
	    velx := 0
	    velx -= runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 20) = 42 then
	    velx := 0
	    velx += runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 50) = 42 then
	    vely := 0
	    vely -= gravity
	    y += vely
	end if
	%COLLISION DETECTION
	%The following code allows the player to stand on blocks by giving a range in both
	%the x and y and telling the program the character is on the ground and puts them at
	%a certain height
	%FLOOR 1
	if x > 0 and x + 25 < maxx and y > -100 and y < 20 then
	    vely := 0
	    groundheight := true
	    y := 20
	    %1ST STEP LEFT SIDE
	elsif x + 25 > 105 and x < 155 and y > 20 and y < 60 then
	    vely := 0
	    groundheight := true
	    y := 60
	    %2ND STEP LEFT SIDE
	elsif x + 25 > 155 and x < 205 and y > 60 and y < 90 then
	    vely := 0
	    groundheight := true
	    y := 90
	    %3RD STEP LEFT SIDE
	elsif x + 25 > 205 and x < 310 and y > 90 and y < 120 then
	    vely := 0
	    groundheight := true
	    y := 120
	    %HELPING STEP
	elsif x + 25 > 650 and x < 696 and y > 20 and y < 60 then
	    vely := 0
	    groundheight := true
	    y := 60
	    %1ST STEP RIGHT SIDE
	elsif x + 25 > 851 and x < 901 and y > 20 and y < 60 then
	    vely := 0
	    groundheight := true
	    y := 60
	    %2ND STEP RIGHT SIDE
	elsif x + 25 > 801 and x < 851 and y > 60 and y < 90 then
	    vely := 0
	    groundheight := true
	    y := 90
	    %3RD STEP RIGHT SIDE
	elsif x + 25 > 696 and x < 801 and y > 90 and y < 120 then
	    vely := 0
	    groundheight := true
	    y := 120
	else
	    %This makes it so that if they aren't on any of these ranges gravity will act on them
	    groundheight := false
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > -100 and y < 50 and bosslives = 0 then
	    include "LEVEL2.T"
	end if
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%BOSS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%If the player comes in contact with the boss from the
	%sides then it will draw the red mirror image of the
	%character, push the character back and accumulate one hit
	if x + 25 > bossx and x + 25 < bossx + 12 and groundheight then
	    Pic.Draw (charhit, x, y, picMerge)
	    velx := 0
	    x += -50
	    delay (10)
	    hit += 1
	end if
	if x < bossx + 25 and x > bossx + 12 and groundheight then
	    Pic.Draw (charhit, x, y, picMerge)
	    velx := 0
	    x += 75
	    delay (10)
	    hit += 1
	end if
	%This controls the boss movement based on the characters position
	if x < bossx and x > 310 and y < 200 then
	    bossx -= 3
	end if
	if x > bossx + 25 and x < 696 and y < 200 then
	    bossx += 3
	end if
	%If the player accumulates 2 hits they will exit this loop and lose a life
	if hit = 2 then
	    exit
	end if
	%This will push the player back after he has jumped on the boss
	%it will also decrease the health of the boss
	if x + 25 > bossx and x < bossx + 12 and y < bossy + 40 and y > bossy + 10 then
	    y += 30
	    x -= 50
	    groundheight := false
	    bosslives -= 1
	end if
	if x > bossx and x < bossx + 25 and y < bossy + 40 and y > bossy + 10 then
	    y += 30
	    x += 50
	    groundheight := false
	    bosslives -= 1
	end if
	%LIVES DISPLAY
	Font.Draw ("Lives:", 0, 640, font6, black)
	if lives = 3 then
	    Font.Draw ("3", 65, 640, font6, black)
	end if
	if lives = 2 then
	    Font.Draw ("2", 65, 640, font6, black)
	end if
	if lives = 1 then
	    Font.Draw ("1", 65, 640, font6, black)
	end if
	delay (50)
	%BOSS LIVES DISPLAY
	%Instead of displaying a number like above it displays
	%his decreasing health bar
	if bosslives = 3 then
	    Font.Draw ("TURING", 150, 560, font6, 42)
	    drawbox (150, 500, 850, 550, black)
	    drawfillbox (150, 500, 850, 550, brightred)
	end if
	if bosslives = 2 then
	    Font.Draw ("TURING", 150, 560, font6, 42)
	    drawbox (150, 500, 850, 550, black)
	    drawfillbox (150, 500, 600, 550, brightred)
	end if
	if bosslives = 1 then
	    Font.Draw ("TURING", 150, 560, font6, 42)
	    drawbox (150, 500, 850, 550, black)
	    drawfillbox (150, 500, 350, 550, brightred)
	end if
	if bosslives = 0 then
	    Font.Draw ("TURING", 150, 560, font6, 42)
	    drawbox (150, 500, 850, 550, black)
	    drawfillbox (150, 500, 150, 550, brightred)
	    drawfillbox (150, 500, 850, 600, 29)
	    %Sets the coordinates off screen so that the player
	    %is not affected by him even when the boss disappears
	    bossx := 1006
	    bossy := -100
	end if
    end loop
    %LIVES SYSTEM
    %Hits is reset
    hit := 0
    %Player loses a life
    lives -= 1
    %Exits loop when lives is 0 prompting game over
    exit when lives = 0
end loop
%Draws the Game Over screen and plays the Game Over music, then goes to the main menu
drawfillbox (0, 0, maxx, maxy, black)
Font.Draw ("GAME OVER", 350, 300, font2, brightred)
View.Update
Music.PlayFile ("Music/Blaster Master (NES) Music - Game Over.mp3")
mainmenu

