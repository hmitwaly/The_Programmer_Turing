%LEVEL 1
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a 
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level1music
%LEVEL 1
loop
    %Sets the x and y coordinates and vely when the player exits the nested
    %loop below which occurs when the player loses a life
    vely := 0
    x := 30
    y := 20
    loop
	%Draws the character
	Pic.Draw (player, x, y, picMerge)
	%Updates the screen
	View.Update
	%Clears the screen
	cls
	%Draws the level
	level1
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
	if x > -15 and x < 400 and y > -100 and y < 20 then
	    vely := 0
	    groundheight := true
	    y := 20
	    %FLOOR 2
	elsif x > 50 and x < 200 and y > 80 and y < 120 then
	    vely := 0
	    groundheight := true
	    y := 120
	    %FLOOR 3
	elsif x + 25 > 130 and x < 300 and y > 180 and y < 220 then
	    vely := 0
	    groundheight := true
	    y := 220
	    %FLOOR 4
	elsif x > 50 and x < 200 and y > 280 and y < 320 then
	    vely := 0
	    groundheight := true
	    y := 320
	    %FLOOR 5
	elsif x + 20 > 130 and x < 300 and y > 380 and y < 420 then
	    vely := 0
	    groundheight := true
	    y := 420
	    %TOP OF WALL 2
	elsif x + 25 > 300 and x < 400 and y > 400 and y < 500 then
	    vely := 0
	    groundheight := true
	    y := 500
	    %SKYBLOCK 1
	elsif x + 25 > 450 and x < 520 and y > 310 and y < 380 then
	    vely := 0
	    groundheight := true
	    y := 380
	    %SKYBLOCK 2
	elsif x + 25 > 570 and x < 640 and y > 250 and y < 320 then
	    vely := 0
	    groundheight := true
	    y := 320
	    %SKYBLOCK 3
	elsif x + 25 > 690 and x < 760 and y > 200 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %FLOOR 6
	elsif x + 25 > 770 and x < maxx and y > -100 and y < 20 then
	    vely := 0
	    groundheight := true
	    y := 20
	    %This makes it so that if they aren't on any of these ranges gravity will act on them
	else
	    groundheight := false
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > -100 and y < 50 then
	    include "LEVEL1BOSS.T"
	end if
	delay (50)
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
	%This code says if the character goes below that y value which is farther down than 
	% the screen shows you, it will exit which makes you lose a life
	exit when y < -500
    end loop
    %LIVES SYSTEM
    %A life is subtracted from lives
    lives -= 1
    %The first loop will exit when lives is 0 prompting the Game Over screen
    exit when lives = 0
end loop
%Draws the Game Over screen and plays the Game Over music, then goes to the main menu
drawfillbox (0, 0, maxx, maxy, black)
Font.Draw ("GAME OVER", 350, 300, font2, brightred)
View.Update
Music.PlayFile ("Music/Blaster Master (NES) Music - Game Over.mp3")
mainmenu
