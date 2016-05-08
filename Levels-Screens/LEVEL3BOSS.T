%LEVEL 3 BOSS
%Sets the screen to offscreenonly which means nothing is outputted unless followed by a
%View.Update
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%Stops music from previous file working
Music.PlayFileStop
%Start music and allows the rest of the program to run
fork level3bossmusic
%Resets hit counter
hit := 0
%Resets a counter
a := 0
%Sets the y and x coordinates of the boss enemy
bossy := 470
bossx := 200
%Gives the boss a set amount of lives
bosslives := 4
%Sets the x and y coordinates of the player
x := 30
y := 50
%Draws the level
level3boss
%  Text
Font.Draw ("Defeat", 457, 620, font6, 18)
Font.Draw ("JAVA", 380, 570, font2, 55)
%Draws player and boss on the screen
Pic.Draw (player, x, y, picMerge)
Pic.Draw (jboss, bossx, bossy, picMerge)
%Updates the screen
View.Update
%Delays program for 1 seconds
delay (1000)
%LEVEL 3 BOSS
%First loop is there for the lives system
loop
    %Sets the initial x and y and vely of the character
    vely := 0
    x := 30
    y := 50
    %Sets bossplatform to false so that all the other blocks and their collision
    %detection code works, if true only the boss platform will appear
    bossplatform := false
    %Second loop is there for actual gameplay
    loop
	%Draws the character
	Pic.Draw (player, x, y, picMerge)
	%Only draws the character if its lives are above
	%0
	if bosslives > 0 then
	    Pic.Draw (jboss, bossx, bossy, picMerge)
	    View.Update
	end if
	%Updates screen
	View.Update
	%Clears the screen
	cls
	%Draws the level depending if boss platform is true or false
	if bossplatform then
	    level3bossbattle
	else
	    level3boss
	end if
	%This piece of code occurs when the boss has been defeated
	%it opens the door and makes it so that the ground is there for the character
	%to get out of the arena.
	if bossx > 0 and bossx < 1100 and bossy < -50 then
	    Font.Draw ("Congratulations", 400, 430, font6, 18)
	    Font.Draw ("You have learned Java!", 350, 400, font6, 18)
	    %opening door
	    drawfillbox (976, 470, 1006, 540, 31)
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
	%DEATH BY LAVA
	if y < -50 then
	    exit
	end if
	%COLLISION DETECTION
	%The following code allows the player to stand on blocks by giving a range in both
	%the x and y and telling the program the character is on the ground and puts them at
	%a certain height
	%FLOOR 1
	if x > 0 and x + 25 < 180 and y > -100 and y < 50 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 50
	    %BLOCK 1
	elsif x + 25 > 200 and x < 240 and y > 60 and y < 100 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 100
	    %STICK 1
	elsif x + 25 > 280 and x < 287 and y > 80 and y < 120 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 120
	    %BLOCK 2
	elsif x + 25 > 327 and x < 367 and y > 100 and y < 140 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 140
	    %STICK 2
	elsif x + 25 > 407 and x < 414 and y > 120 and y < 160 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 160
	    %BLOCK 3
	elsif x + 25 > 454 and x < 494 and y > 140 and y < 180 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 180
	    %STICK 3
	elsif x + 25 > 534 and x < 541 and y > 160 and y < 200 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 200
	    %BLOCK 4
	elsif x + 25 > 581 and x < 621 and y > 180 and y < 220 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 220
	    %STICK 4
	elsif x + 25 > 661 and x < 668 and y > 200 and y < 240 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 240
	    %BLOCK 5
	elsif x + 25 > 701 and x < 741 and y > 220 and y < 260 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 260
	    %STICK 5
	elsif x + 25 > 781 and x < 788 and y > 240 and y < 280 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 280
	    %BLOCK 6
	elsif x + 25 > 828 and x < 868 and y > 260 and y < 300 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 300
	    %BASE PLATFORM
	elsif x + 25 > 890 and x < 995 and y > 290 and y < 330 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 330
	    %BASEBLOCK 1
	elsif x + 25 > 970 and x < 996 and y > 340 and y < 380 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 380
	    %BASEBLOCK2
	elsif x + 25 > 910 and x < 936 and y > 390 and y < 430 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 430
	    %SHORT PLATFORM
	elsif x + 25 > 761 and x < 910 and y > 430 and y < 470 and not bossplatform then
	    vely := 0
	    groundheight := true
	    y := 470
	    %BOSS PLATFORM
	elsif x + 25 > 100 and x < 700 and y > 430 and y < 470 then
	    vely := 0
	    groundheight := true
	    y := 470
	    bossplatform := true
	else
	    %This makes it so that if they aren't on any of these ranges gravity will act on them
	    groundheight := false
	end if
	%This is here because this is a special boss that feels gravity so we have to
	%code collision detection for him as well so he does not fall through the platform
	if bossx + 25 > 100 and bossx < 700 and bossy > 430 and bossy < 470 then
	    bossy := 470
	end if
	%PROCEEDING TO NEXT LEVEL
	if x + 25 > 1000 and y > 460 and y < 660 and bosslives = 0 then
	    include "G:/HBBGAME/Levels-Screens/VICTORYSCREEN.T"
	end if
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%BOSS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%If the player comes in contact with the boss from the
	%sides then it will draw the red mirror image of the
	%character, push the character back and accumulate one hit
	if x + 25 > bossx and x + 25 < bossx + 15 and y > bossy - 5 and y < bossy + 20 then
	    Pic.Draw (charhit, x, y, picMerge)
	    velx := 0
	    x += -100
	    delay (10)
	    hit += 1
	end if
	if x < bossx + 30 and x > bossx + 15 and y > bossy - 5 and y < bossy + 20 then
	    Pic.Draw (charhit, x, y, picMerge)
	    velx := 0
	    x += 125
	    delay (10)
	    hit += 1
	end if
	%This controls the boss movement based on the characters position
	if x < bossx and x > 0 and y > 469 and y < 660 then
	    bossx -= speed
	end if
	if x > bossx + 25 and x < 730 and y > 469 and y < 660 then
	    bossx += speed
	end if
	if bosslives < 2 and x + 25 > 750 and x < 910 and y > 430 and y < 470 then
	    bossx += speed
	end if
	%If the player accumulates 2 hits they will exit this loop and lose a life
	if hit = 2 then
	    exit
	end if
	%This will push the player back after he has jumped on the boss
	%it will also decrease the health of the boss
	if x + 25 > bossx and x < bossx + 15 and y < bossy + 45 and y > bossy + 10 and bosslives > 0 then
	    y += 30
	    x -= 50
	    groundheight := false
	    bosslives -= 1
	end if
	if x > bossx and x < bossx + 25 and y < bossy + 45 and y > bossy + 10 and bosslives > 0 then
	    y += 30
	    x += 50
	    groundheight := false
	    bosslives -= 1
	end if
	%If the boss falls into the lava he loses a life but its set up so that
	%it is his last life
	if bossy < -500 then
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
	%BOSS LIVES DISPLAY
	%Instead of displaying a number like above it displays
	%his decreasing health bar it also increases his speed
	if bosslives = 4 then
	    Font.Draw ("JAVA", 250, 630, font6, 54)
	    drawbox (250, 580, 850, 620, black)
	    drawfillbox (250, 580, 850, 620, brightred)
	    speed := 3
	end if
	if bosslives = 3 then
	    Font.Draw ("JAVA", 250, 630, font6, 54)
	    drawbox (250, 580, 850, 620, black)
	    drawfillbox (250, 580, 650, 620, brightred)
	    speed := 4
	end if
	if bosslives = 2 then
	    Font.Draw ("JAVA", 250, 630, font6, 54)
	    drawbox (250, 580, 850, 620, black)
	    drawfillbox (250, 580, 450, 620, brightred)
	    speed := 5
	end if
	%This draws an extra platform for the character to escape from the boss
	if bosslives < 2 then
	    Font.Draw ("JAVA", 250, 630, font6, 54)
	    drawbox (250, 580, 850, 620, black)
	    drawfillbox (250, 580, 250, 620, brightred)
	    speed := 6
	    drawfillbox (760, 460, 1100, 470, 54) %  short platform
	    %SHORT PLATFORM
	    if x + 25 > 750 and x < 1100 and y > 430 and y < 470 then
		vely := 0
		groundheight := true
		y := 470
	    end if
	end if
	%If the boss has fallen out of the screen the full platform will be drawn
	%and hit detection for it is true
	if bossx > 0 and bossx < 1100 and bossy < -50 then
	    Font.Draw ("JAVA", 250, 630, font6, 54)
	    drawbox (250, 580, 850, 620, black)
	    drawfillbox (250, 580, 250, 620, brightred)
	    drawfillbox (250, 580, 850, 650, 31)
	    drawfillbox (0, 460, 1100, 470, 54) %  short platform
	    if x + 25 > 0 and x < 1100 and y > 430 and y < 470 then
		vely := 0
		groundheight := true
		y := 470
	    end if
	    %Sets coordinates off the screen as to not interfere with character
	    %after disappearing
	    bossx := 1006
	    bossy := -100
	    bosslives := 0
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
Font.Draw ("GAME OVER", 325, 300, font2, brightred)
View.Update
Music.PlayFile ("G:/HBBGAME/Music/Blaster Master (NES) Music - Game Over.mp3")
mainmenu
