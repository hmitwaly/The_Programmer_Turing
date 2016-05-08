% VICTORY SCREEN 
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
% Plays the music and allows the rest of the program to run
fork victorymusic
%Sets the x of Ms.G and the player also resets the a counter
msgx := 475
x := 30
y := 15
a := 0
loop
    %Draws the player at x and y
    Pic.Draw (player, x, y, picMerge)
    %Draws her only a is 0 otherwise she is not drawn anymore
    if a = 0 then
	Pic.Draw (MsGalati, msgx, 15, picMerge)
    end if
    View.Update
    cls
    victorylevel
    %GRAVITY
    if not groundheight then
	vely -= gravity
	y += vely
    end if
    %CONTROLS
    Input.KeyDown (keys)
    if keys (KEY_UP_ARROW) and groundheight = true then
	vely := jumpspeed
	y += vely
    end if
    if keys (KEY_RIGHT_ARROW) and x + 25 not= maxx then
	velx := runspeed
	x += velx
    elsif keys (KEY_LEFT_ARROW) and x not= -15 then
	velx := -runspeed
	x += velx
    else
	velx := 0
    end if
    %This sets the collision detection for the ground and makes it
    %so that he doesnt fall through the floor.
    if x > 0 and x < maxx and y < 15 and y > -100 then
	vely := 0
	groundheight := true
	y := 15
    else
	groundheight := false
    end if
    %Makes a add as long as character is past 400 making Ms G stop being drawn
    if x > 400 then
	a += 1
    end if
    %Starts the speaking portion of the screen
    if x > 400 and a = 1 then
	Font.Draw ("Congratulations young programmer", 380, 330, font6, black)
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	View.Update
	delay (2000)
	drawfillbox (380, 300, 1100, 360, 53)
	Font.Draw ("I am the Programming Teacher", 380, 330, font6, black)
	View.Update
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	delay (2000)
	drawfillbox (380, 300, 1100, 360, 53)
	Font.Draw ("You have successfully passed my tests", 380, 330, font6, black)
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	View.Update
	delay (2000)
	drawfillbox (380, 300, 1100, 360, 53)
	Font.Draw ("and have successfully learned all", 380, 330, font6, black)
	Font.Draw ("three programming languages", 380, 310, font6, black)
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	View.Update
	delay (3000)
	drawfillbox (380, 300, 1100, 360, 53)
	Font.Draw ("You have earned the title of", 380, 330, font6, black)
	Font.Draw (" The Programmer", 720, 330, font6, brightred)
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	View.Update
	delay (4000)
	drawfillbox (380, 300, 1100, 360, 53)
	Font.Draw ("See you next year", 380, 330, font6, black)
	Pic.Draw (player, x, y, picMerge)
	Pic.Draw (MsGalati, msgx, 15, picMerge)
	View.Update
	delay (2000)
	drawfillbox (0, 300, 1100, 370, 53)
	%Makes Ms G move toward the school
	for i : 1 .. 60
	    Pic.Draw (player, x, y, picMerge)
	    Pic.Draw (MsGalati, 475 + i * 5, 15, picMerge)
	    View.Update
	    cls
	    victorylevel
	    delay (50)
	end for
	%Continually draws an oval larger and larger to transition into the 
	%Credits screen
	for i : 1 .. 600
	    Pic.Draw (player, x, y, picMerge)
	    drawfilloval (503, 330, 0 + i, 0 + i, 18)
	    delay (10)
	    View.Update
	end for
	exit
    end if
    delay (50)
end loop
%Goes to the Credit Screen
include "CREDITSCREEN.T"
