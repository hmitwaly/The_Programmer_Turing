%LEVEL 2 BOSS
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level2bossmusic
%Resets hit counter
hit := 0
%Resets a counter
a := 0
%Sets the x and y coordinates of the boss enemy
bossy := 20
bossx := 600
%Gives the boss a set amount of lives
bosslives := 5
%Sets the x and y coordinates of the player
x := 30
y := 20
%Draws the level
level2boss
%  Text
Font.Draw ("Defeat", 457, 620, font6, 18)
Font.Draw ("PYTHON", 380, 570, font2, 55)
%Draws player and boss on the screen
Pic.Draw (player, x, y, picMerge)
Pic.Draw (pboss, bossx, bossy, picMerge)
%Updates the screen
View.Update
%Delays program for 1 second
delay (1000)
%LEVEL 2 BOSS
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
	    Pic.Draw (pboss, bossx, bossy, picMerge)
	    View.Update
	end if
	%Updates screen
	View.Update
	%Clears the screen
	cls
	%Draws the level
	level2boss
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
	if keys (KEY_RIGHT_ARROW) and x + 25 not= maxx then
	    velx := runspeed
	    x += velx
	    % If the key left arrow is pressed and they arent at 0 they will move to the left.
	elsif keys (KEY_LEFT_ARROW) and x - 15 not= 0 then
	    velx := -runspeed
	    x += velx
	else
	    velx := 0
	end if
	%HIT DETECTION FOR SIDES AND HEAD
	% View.WhatDotColor is a command that determines the colour of
	% a pixel. In this case when the characters colour hits the colour of
	% 54 then it will oppose the movement of the character to stop them
	%from going through a block.
	if View.WhatDotColor (x + 20, y + 20) = 54 then
	    velx := 0
	    velx -= runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 20) = 54 then
	    velx := 0
	    velx += runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 50) = 54 then
	    vely := 0
	    vely -= gravity
	    y += vely
	end if
	%COLLISION DETECTION
	%The following code allows the player to stand on blocks by giving a range in both
	%the x and y and telling the program the character is on the ground and puts them at
	%a certain height
	%FLOOR 1
	if x > 0 and x + 25 < 1100 and y > -100 and y < 20 then
	    vely := 0
	    groundheight := true
	    y := 20
	    %PLATFORM 1
	elsif x + 25 > 120 and x < 230 and y > 50 and y < 95 then
	    vely := 0
	    groundheight := true
	    y := 95
	    %PLATFORM 2
	elsif x + 25 > 0 and x < 80 and y > 120 and y < 165 then
	    vely := 0
	    groundheight := true
	    y := 165
	    %PLATFORM 3
	elsif x + 25 > 120 and x < 230 and y > 190 and y < 235 then
	    vely := 0
	    groundheight := true
	    y := 235
	    %PLATFORM 4
	elsif x + 25 > 0 and x < 80 and y > 260 and y < 305 then
	    vely := 0
	    groundheight := true
	    y := 305
	    %PLATFORM 5
	elsif x + 25 > 120 and x < 230 and y > 330 and y < 375 then
	    vely := 0
	    groundheight := true
	    y := 375
	    %PLATFORM 6
	elsif x + 25 > 0 and x < 80 and y > 400 and y < 445 then
	    vely := 0
	    groundheight := true
	    y := 445
	    %PLATFORM 7
	elsif x + 25 > 120 and x < 230 and y > 470 and y < 515 then
	    vely := 0
	    groundheight := true
	    y := 515
	else
	    groundheight := false
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > -100 and y < 50 and bosslives = 0 then
	    include "LEVEL3.T"
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
	if x < bossx and x > 230 and y < 200 then
	    bossx -= 6
	end if
	if x > bossx + 25 and x < 960 and y < 200 then
	    bossx += 6
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
	Font.Draw ("Lives:", 10, 630, font6, black)
	if lives = 3 then
	    Font.Draw ("3", 75, 630, font6, black)
	end if
	if lives = 2 then
	    Font.Draw ("2", 75, 630, font6, black)
	end if
	if lives = 1 then
	    Font.Draw ("1", 75, 630, font6, black)
	end if
	delay (50)
	if bosslives = 5 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 850, 550, brightred)
	end if
	%BOSS LIVES DISPLAY
	%Instead of displaying a number like above it displays
	%his decreasing health bar
	if bosslives = 4 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 735, 550, brightred)
	end if
	if bosslives = 3 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 620, 550, brightred)
	end if
	if bosslives = 2 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 505, 550, brightred)
	end if
	if bosslives = 1 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 390, 550, brightred)
	end if
	if bosslives = 0 then
	    Font.Draw ("PYTHON", 250, 560, font6, 54)
	    drawbox (250, 500, 850, 550, black)
	    drawfillbox (250, 500, 250, 550, brightred)
	    drawfillbox (250, 500, 850, 600, 92)
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
