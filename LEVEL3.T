%LEVEL 3
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level3music
%LEVEL 2
%This gives the player another life as long as the player has less than 3 lives
if lives < 3 then
    lives += 1
end if
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
	level3
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
	if View.WhatDotColor (x + 20, y + 20) = 54 or View.WhatDotColor (x + 20, y + 20) = 42 then
	    velx := 0
	    velx -= runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 20) = 54 or View.WhatDotColor (x, y + 20) = 42 then
	    velx := 0
	    velx += runspeed
	    x += velx
	end if
	if View.WhatDotColor (x, y + 50) = 54 or View.WhatDotColor (x, y + 50) = 42 then
	    vely := 0
	    vely -= gravity
	    y += vely
	end if
	%COLLISION DETECTION
	%The following code allows the player to stand on blocks by giving a range in both
	%the x and y and telling the program the character is on the ground and puts them at
	%a certain height
	%FLOOR 1
	if x > 0 and x + 25 < 1100 and y > -100 and y < 10 then
	    vely := 0
	    groundheight := true
	    y := 10
	    %HELPING BLOCK 1ST LEVEL
	elsif x + 25 > 940 and x < 1006 and y > 10 and y < 60 then
	    vely := 0
	    groundheight := true
	    y := 60
	    %PLATFORM1 2ND LEVEL
	elsif x + 25 > 740 and x < 906 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %PLATFORM2 2ND LEVEL
	elsif x + 25 > 630 and x < 680 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %PLATFORM3 2ND LEVEL
	elsif x + 25 > 520 and x < 570 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %PLATFORM4 2ND LEVEL
	elsif x + 25 > 410 and x < 460 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %PLATFORM5 2ND LEVEL
	elsif x + 25 > 300 and x < 350 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %PLATFORM6 2ND LEVEL
	elsif x + 25 > 0 and x < 240 and y > 100 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %HELPING BLOCK 2ND LEVEL
	elsif x + 25 > 11 and x < 66 and y > 140 and y < 190 then
	    vely := 0
	    groundheight := true
	    y := 190
	    %PLATFORM1 3RD LEVEL
	elsif x + 25 > 740 and x < 1006 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %PLATFORM2 3RD LEVEL
	elsif x + 25 > 630 and x < 680 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %PLATFORM3 3RD LEVEL
	elsif x + 25 > 520 and x < 570 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %PLATFORM4 3RD LEVEL
	elsif x + 25 > 410 and x < 460 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %PLATFORM5 3RD LEVEL
	elsif x + 25 > 300 and x < 350 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %PLATFORM6 3RD LEVEL
	elsif x + 25 > 100 and x < 240 and y > 220 and y < 270 then
	    vely := 0
	    groundheight := true
	    y := 270
	    %HELPING BLOCK 3RD LEVEL
	elsif x + 25 > 940 and x < 1006 and y > 270 and y < 320 then
	    vely := 0
	    groundheight := true
	    y := 320
	    %PLATFORM1 4TH LEVEL
	elsif x + 25 > 0 and x < 240 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %PLATFORM2 4TH LEVEL
	elsif x + 25 > 300 and x < 350 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %PLATFORM3 4TH LEVEL
	elsif x + 25 > 410 and x < 460 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %PLATFORM4 4TH LEVEL
	elsif x + 25 > 520 and x < 570 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %PLATFORM5 4TH LEVEL
	elsif x + 25 > 630 and x < 680 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %PLATFORM6 4TH LEVEL
	elsif x + 25 > 740 and x < 906 and y > 350 and y < 400 then
	    vely := 0
	    groundheight := true
	    y := 400
	    %HELPING BLOCK 4TH LEVEL
	elsif x + 25 > 11 and x < 66 and y > 400 and y < 450 then
	    vely := 0
	    groundheight := true
	    y := 450
	    %PLATFORM1 5TH LEVEL
	elsif x + 25 > 100 and x < 240 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %PLATFORM2 5TH LEVEL
	elsif x + 25 > 300 and x < 350 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %PLATFORM3 5TH LEVEL
	elsif x + 25 > 410 and x < 460 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %PLATFORM4 5TH LEVEL
	elsif x + 25 > 520 and x < 570 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %PLATFORM5 5TH LEVEL
	elsif x + 25 > 630 and x < 680 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %PLATFORM6 5TH LEVEL
	elsif x + 25 > 740 and x < 940 and y > 480 and y < 530 then
	    vely := 0
	    groundheight := true
	    y := 530
	    %HELPING BLOCK 5TH LEVEL
	elsif x + 25 > 940 and x < 1006 and y > 510 and y < 570 then
	    vely := 0
	    groundheight := true
	    y := 570
	%This is the code that tell the program to exit the loop if they land on
	%at the point part of the spike
	    %SPIKE 1
	elsif x + 25 > 265 and x < 275 and y > 0 and y < 30 then
	    exit
	    %SPIKE 2
	elsif x + 25 > 375 and x < 385 and y > 0 and y < 30 then
	    exit
	    %SPIKE 3
	elsif x + 25 > 485 and x < 495 and y > 0 and y < 30 then
	    exit
	    %SPIKE 4
	elsif x + 25 > 595 and x < 605 and y > 0 and y < 30 then
	    exit
	    %SPIKE 5
	elsif x + 25 > 705 and x < 715 and y > 0 and y < 30 then
	    exit
	else
	%This makes it so that if they aren't on any of these ranges gravity will act on them
	    groundheight := false
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > 550 and y < 660 then
	    include "LEVEL3BOSS.T"
	end if
	%LIVES DISPLAY
	Font.Draw ("Lives:", 10, 640, font6, black)
	if lives = 3 then
	    Font.Draw ("3", 75, 640, font6, black)
	end if
	if lives = 2 then
	    Font.Draw ("2", 75, 640, font6, black)
	end if
	if lives = 1 then
	    Font.Draw ("1", 75, 640, font6, black)
	end if
	delay (50)
    end loop
    %LIVES SYSTEM
    %A life is subtracted from lives
    lives -= 1
    %The first loop is exited when lives is 0
    exit when lives = 0
end loop
%Draws the Game Over screen and plays the Game Over music, then goes to the main menu
drawfillbox (0, 0, maxx, maxy, black)
Font.Draw ("GAME OVER", 350, 300, font2, brightred)
View.Update
Music.PlayFile ("Music/Blaster Master (NES) Music - Game Over.mp3")
mainmenu
