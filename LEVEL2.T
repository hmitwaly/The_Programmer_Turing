%LEVEL 2
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level2music
%LEVEL 2
%Sets the x and y-coordinates for each of the enemies on the screen.
ex (1) := 9
ex (2) := 500
ey (1) := 490
ey (2) := 20
%Gives each enemy a life.
for i : 1 .. enemies
    elives (i) := 1
end for
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
	level2
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
	    %FLOORBLOCK 1
	elsif x > 490 and x + 25 < 520 and y > -100 and y < 50 then
	    vely := 0
	    groundheight := true
	    y := 50
	    %FLOORBLOCK 2
	elsif x > 800 and x + 25 < 830 and y > -100 and y < 50 then
	    vely := 0
	    groundheight := true
	    y := 50
	    %SKYPLATFORM 1
	elsif x + 25 > 100 and x < 200 and y > 60 and y < 120 then
	    vely := 0
	    groundheight := true
	    y := 120
	    %SKYBLOCK 2
	elsif x + 25 > 240 and x < 260 and y > 80 and y < 140 then
	    vely := 0
	    groundheight := true
	    y := 140
	    %SKYPLATFORM 3
	elsif x + 25 > 300 and x < 400 and y > 120 and y < 180 then
	    vely := 0
	    groundheight := true
	    y := 180
	    %SKYBLOCK 4
	elsif x + 25 > 440 and x < 460 and y > 160 and y < 220 then
	    vely := 0
	    groundheight := true
	    y := 220
	    %SKYPLATFORM 5
	elsif x + 25 > 500 and x < 600 and y > 200 and y < 260 then
	    vely := 0
	    groundheight := true
	    y := 260
	    %SKYBLOCK 6
	elsif x + 25 > 640 and x < 660 and y > 240 and y < 300 then
	    vely := 0
	    groundheight := true
	    y := 300
	    %SKYPLATFORM 7
	elsif x + 25 > 700 and x < 800 and y > 280 and y < 340 then
	    vely := 0
	    groundheight := true
	    y := 340
	    %SKYBLOCK 8
	elsif x + 25 > 840 and x < 860 and y > 320 and y < 380 then
	    vely := 0
	    groundheight := true
	    y := 380
	    %SKYPLATFORM 9
	elsif x + 25 > 900 and x < 1000 and y > 360 and y < 420 then
	    vely := 0
	    groundheight := true
	    y := 420
	    %SKYBLOCK 10
	elsif x + 25 > 870 and x < 890 and y > 480 and y < 520 then
	    vely := 0
	    groundheight := true
	    y := 520
	    %SKYPLATFORM 11
	elsif x + 25 > 700 and x < 820 and y > 440 and y < 490 then
	    vely := 0
	    groundheight := true
	    y := 490
	    %HELPING BLOCK
	elsif x + 25 > 950 and x < 1000 and y > 400 and y < 460 then
	    vely := 0
	    groundheight := true
	    y := 460
	    %LONG PLATFORM
	elsif x + 25 > 0 and x < 640 and y > 420 and y < 490 then
	    vely := 0
	    groundheight := true
	    y := 490
	    %LONG PLATFORM BLOCK
	elsif x + 25 > 290 and x < 320 and y > 430 and y < 520 then
	    vely := 0
	    groundheight := true
	    y := 520
	    %This makes it so that if they aren't on any of these ranges gravity will act on them
	else
	    groundheight := false
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > -100 and y < 50 and opendoor then
	    include "LEVEL2BOSS.T"
	end if
	%This range is used to simulate a button being activated
	if x + 25 > 20 and x < 60 and y > 470 and y < 520 then
	    opendoor := true
	end if
	%When the button is active it will draw the green button and open
	%the door
	if opendoor then
	    drawfilloval (40, 510, 10, 10, brightgreen)%Button
	    drawoval (40, 510, 10, 10, 7)%Button outline
	    drawfillbox (996, 130, 1006, 20, 92)     %  Door
	end if
	%%%%%%ENEMY%%%%%%%%%%%%
	% Sets the collision detection for each of the enemies.
	for i : 1 .. enemies
	    % If the enemy hits the colour of number 54, then it will
	    % move to the right
	    if View.WhatDotColour (ex (i), ey (i) + 20) = 54 then
		evelx := 3
	    end if
	    % If the enemy hits the colour of number 54 again then it will
	    %move towards the left.
	    if View.WhatDotColour (ex (i) + 40, ey (i) + 20) = 54 then
		evelx := -3
	    end if
	    ex (i) += evelx
	    % This draws the enemy if the number of lives per enemy is greater than 0.
	    if elives (i) > 0 then
		Pic.Draw (epic, ex (i), ey (i), picMerge)
	    end if
	end for
	%%%%%%%%%%%ENEMY DEATH%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	for i : 1 .. enemies
	%If the player falls into the range of the enemy from the top of the
	%enemy the enemy will lose a life and not be drawn anymore. The x and
	% y coordinates are made to go off the screen so they enemy doesn't
	%continue to exit even though not drawn
	    if x + 25 > ex (i) and x < ex (i) + 25 and y < ey (i) + 40 and y > ey (i) + 10 then
		elives (i) -= 1
		ecount -= 1
		ex (i) := 100000
		ey (i) := 100000
	    end if
	%If the player hits the enemies from his side he will get pushed back
	%and hurt(shown by red outline)and a hit is accumulated
	    if x + 25 > ex (i) and x + 25 < ex (i) + 25 and y > ey (i) - 5 and y < ey (i) + 5 then
		Pic.Draw (charhit, x, y, picMerge)
		velx := 0
		x += -50
		delay (10)
		hit += 1
	    elsif x < ex (i) + 50 and x > ex (i) + 25 and y > ey (i) - 5 and y < ey (i) + 5 then
		Pic.Draw (charhit, x, y, picMerge)
		velx := 0
		x += 75
		delay (10)
		hit += 1
	    end if
	end for
	%If the player accumulates 2 hits it will exit this loop and they
	%will lose a life
	exit when hit = 2
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
    end loop
    %LIVES SYSTEM
    %Hits is reset when they die
    hit := 0
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
