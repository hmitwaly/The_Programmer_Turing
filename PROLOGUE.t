%PROLOGUE
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
% Plays the music and allows the rest of the program to run
fork prologuemusic
%Sets the coordinates of the player at the initial screen
x := 210
y := 15
%  Background
drawfillbox (0, 0, maxx, maxy, 53)
%  Sun
drawfilloval (0, 660, 150, 150, yellow)
%  Sidewallk
drawfillbox (0, 0, 1006, 15, 30) %  grey block
drawbox (0, -1, 1006, 15, black) %  grey block outline
drawbox (51, -1, 101, 15, black) % 1
drawbox (151, -1, 206, 15, black) % 1
drawbox (206, -1, 251, 15, black) % 1
drawbox (301, -1, 351, 15, black) % 2
drawbox (351, -1, 401, 15, black) % 3
drawbox (451, -1, 501, 15, black) % 4
drawbox (551, -1, 601, 15, black) % 5
drawbox (651, -1, 701, 15, black) % 6
drawbox (651, -1, 701, 15, black) % 7
drawbox (751, -1, 801, 15, black) % 8
drawbox (851, -1, 901, 15, black) % 9
drawbox (951, -1, 1001, 15, black) % 10
%  House
drawfillbox (5, 16, 205, 160, 27) %  box
drawbox (5, 16, 205, 160, black) %  box ourline
Draw.ThickLine (230, 160, 100, 300, 4, black) %  Roof right line
Draw.ThickLine (1, 160, 230, 160, 4, black) %  Roof bottom line
Draw.ThickLine (100, 300, -24, 150, 4, black) %  Roof left line
Draw.Fill (120, 230, brightred, black) %  roof colour
drawbox (20, 153, 80, 100, black) %  Left window
drawbox (130, 153, 190, 100, black) %  right window
drawbox (80, 15, 130, 90, black) %  Door
drawfilloval (122, 50, 3, 3, black) %  Door handle
%  Clouds
drawfilloval (400, 580, 140, 30, white)
drawfilloval (400, 580, 53, 53, white)
drawfilloval (340, 580, 40, 40, white)
drawfilloval (460, 580, 35, 35, white)
drawfilloval (500, 580, 30, 30, white)
drawfilloval (300, 580, 28, 28, white)

drawfilloval (700, 530, 140, 30, white)
drawfilloval (700, 530, 53, 53, white)
drawfilloval (640, 530, 40, 40, white)
drawfilloval (760, 530, 35, 35, white)
drawfilloval (800, 530, 30, 30, white)
drawfilloval (600, 530, 28, 28, white)

drawfilloval (100, 540, 140, 30, white)
drawfilloval (100, 540, 53, 53, white)
drawfilloval (40, 540, 40, 40, white)
drawfilloval (160, 540, 35, 35, white)
drawfilloval (200, 540, 30, 30, white)
drawfilloval (0, 540, 28, 28, white)

drawfilloval (1000, 590, 140, 30, white)
drawfilloval (1000, 590, 53, 53, white)
drawfilloval (940, 590, 40, 40, white)
drawfilloval (1060, 590, 35, 35, white)
drawfilloval (1100, 590, 30, 30, white)
drawfilloval (900, 590, 28, 28, white)
Font.Draw ("Today is the day I learn all 3 programming languages!", 100, 360, font6, black)
%Draws the player
Pic.Draw (player, x, y, picMerge)
View.Update
delay (5000)
loop
    %We have to draw it twice because there is one for the initial screen and
    %then the part that allows the character to move
    %  Background
    drawfillbox (0, 0, maxx, maxy, 53)
    %  Sun
    drawfilloval (0, 660, 150, 150, yellow)
    %  Sidewallk
    drawfillbox (0, 0, 1006, 15, 30) %  grey block
    drawbox (0, -1, 1006, 15, black) %  grey block outline
    drawbox (51, -1, 101, 15, black) % 1
    drawbox (151, -1, 206, 15, black) % 1
    drawbox (206, -1, 251, 15, black) % 1
    drawbox (301, -1, 351, 15, black) % 2
    drawbox (351, -1, 401, 15, black) % 3
    drawbox (451, -1, 501, 15, black) % 4
    drawbox (551, -1, 601, 15, black) % 5
    drawbox (651, -1, 701, 15, black) % 6
    drawbox (651, -1, 701, 15, black) % 7
    drawbox (751, -1, 801, 15, black) % 8
    drawbox (851, -1, 901, 15, black) % 9
    drawbox (951, -1, 1001, 15, black) % 10
    %  House
    drawfillbox (5, 16, 205, 160, 27) %  box
    drawbox (5, 16, 205, 160, black) %  box ourline
    Draw.ThickLine (230, 160, 100, 300, 4, black) %  Roof right line
    Draw.ThickLine (1, 160, 230, 160, 4, black) %  Roof bottom line
    Draw.ThickLine (100, 300, -24, 150, 4, black) %  Roof left line
    Draw.Fill (120, 230, brightred, black) %  roof colour
    drawbox (20, 153, 80, 100, black) %  Left window
    drawbox (130, 153, 190, 100, black) %  right window
    drawbox (80, 15, 130, 90, black) %  Door
    drawfilloval (122, 50, 3, 3, black) %  Door handle
    %  Clouds
    drawfilloval (400, 580, 140, 30, white)
    drawfilloval (400, 580, 53, 53, white)
    drawfilloval (340, 580, 40, 40, white)
    drawfilloval (460, 580, 35, 35, white)
    drawfilloval (500, 580, 30, 30, white)
    drawfilloval (300, 580, 28, 28, white)

    drawfilloval (700, 530, 140, 30, white)
    drawfilloval (700, 530, 53, 53, white)
    drawfilloval (640, 530, 40, 40, white)
    drawfilloval (760, 530, 35, 35, white)
    drawfilloval (800, 530, 30, 30, white)
    drawfilloval (600, 530, 28, 28, white)

    drawfilloval (100, 540, 140, 30, white)
    drawfilloval (100, 540, 53, 53, white)
    drawfilloval (40, 540, 40, 40, white)
    drawfilloval (160, 540, 35, 35, white)
    drawfilloval (200, 540, 30, 30, white)
    drawfilloval (0, 540, 28, 28, white)

    drawfilloval (1000, 590, 140, 30, white)
    drawfilloval (1000, 590, 53, 53, white)
    drawfilloval (940, 590, 40, 40, white)
    drawfilloval (1060, 590, 35, 35, white)
    drawfilloval (1100, 590, 30, 30, white)
    drawfilloval (900, 590, 28, 28, white)
    Font.Draw ("<Press the arrow keys to move around>", 380, 330, font6, black)
    Font.Draw ("<Jump on enemies to debug them>", 380, 300, font6, black)
    Font.Draw ("<Reach the endpoint of the level to proceed>", 380, 270, font6, black)
    %Draws the player
    Pic.Draw (player, x, y, picMerge)
    View.Update
    cls
    %GRAVITY
    if not groundheight then
	%subtracts gravity from vely
	vely -= gravity
	%adds vely to y which changes the position of the character vertically
	y += vely
    end if
    %CONTROLS
    Input.KeyDown (keys)
    if keys (KEY_UP_ARROW) and groundheight = true then
	%makes vely jumpspeed
	vely := jumpspeed
	%adds vely to y to change the position of the character vertically
	y += vely
    end if
    if keys (KEY_RIGHT_ARROW) and x + 25 not= maxx then
	%makes velx runspeed
	velx := runspeed
	%adds velx to x to change the position of the character horizontally
	x += velx
    elsif keys (KEY_LEFT_ARROW) and x not= -15 then
	%makes velx runspeed
	velx := -runspeed
	%adds velx to x to change the position of the character horizontally
	x += velx
    else
	velx := 0
    end if
    %This sets the collision detection for the ground and makes it
    %so that he doesnt fall through the floor.
    if x > 0 and x < maxx and y < 15 and y > -100 then
	vely := 0
	%makes it so that the character can jump
	groundheight := true
	%sets him at a specific height so we doesn't fall through
	y := 15
    else
	%allows gravity to start acting on the character
	groundheight := false
    end if
    %Allows the player to proceed to the next level and stops the music
    %from playing anymore
    if x + 25 > 1000 and y > -100 and y < 20 then
	Music.PlayFileStop
	%goes to the file below
	include "LEVEL1.T"
    end if
    delay (50)
end loop
