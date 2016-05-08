%SELECTIONSCREEN
View.Set ("graphics:1006;660,nobuttonbar")
%Start music and allows the rest of the program to run
fork selectionmusic
%  Background colour
drawfillbox (0, 0, maxx, maxy, 18)
drawbox (0, 0, 1006, 660, 53)
%  Title
Font.Draw ("SELECT YOUR CHARACTER", 240, 600, font4, 53)
%  Character box outlines
drawbox (180, 560, 485, 350, 53) %  top left box
drawbox (505, 560, 810, 350, 53) %  top right box
drawbox (180, 290, 485, 80, 53) %  bottom left box
drawbox (505, 290, 810, 80, 53) %  bottom right box
%  Names
Font.Draw ("Betsegaw", 254, 530, font5, 14)
Font.Draw ("Bharath", 590, 530, font5, 14)
Font.Draw ("Hossam", 270, 260, font5, 14)
Font.Draw ("<< Choose a character by clicking on their box >>", 151, 40, font7, brightred)
Font.Draw ("<-- Go Back", 17, 630, font6, brightred)
%This makes it so that the label on the selection screen will change
%depending on if the cheat 'luffy' was used
if luffyselect then
    Font.Draw ("Luffy", 600, 260, font5, 14)
else
    Font.Draw ("??????", 600, 260, font5, 14)
end if
%  characters
Pic.Draw (hossamo, 310, 155, picCopy)
Pic.Draw (betsegawo, 310, 420, picCopy)
Pic.Draw (bharatho, 632, 420, picCopy)
%This makes it so the picture on the selection screen will change
%depending on if the cheat 'luffy' was used
if luffyselect then
    Pic.Draw (luffyo, 640, 150, picCopy)
else
    Pic.Draw (lockedchar, 640, 150, picCopy)
end if
loop
    % The mousewhere procedure is used to get current information about
    % the status of the mouse. mousex and mousey are set to the current location
    % of the mouse cursor.
    mousewhere (mousex, mousey, button)
    %The following code will make it so that if the mouse is in the range the 
    %box and name will be highlighted
    if mousex > 180 and mousex < 485 and mousey > 350 and mousey < 560 then
	drawbox (180, 560, 485, 350, white)
	Font.Draw ("Betsegaw", 254, 530, font5, white)
	View.Update
    else
	drawbox (180, 560, 485, 350, 53)
	Font.Draw ("Betsegaw", 254, 530, font5, 14)
	View.Update
    end if
    if mousex > 505 and mousex < 810 and mousey > 350 and mousey < 560 then
	drawbox (505, 560, 810, 350, white)
	Font.Draw ("Bharath", 590, 530, font5, white)
	View.Update
    else
	drawbox (505, 560, 810, 350, 53)
	Font.Draw ("Bharath", 590, 530, font5, 14)
	View.Update
    end if
    if mousex > 180 and mousex < 485 and mousey > 120 and mousey < 330 then
	drawbox (180, 290, 485, 80, white)
	Font.Draw ("Hossam", 270, 260, font5, white)
	View.Update
    else
	drawbox (180, 290, 485, 80, 53)
	Font.Draw ("Hossam", 270, 260, font5, 14)
	View.Update
    end if
    if mousex > 505 and mousex < 810 and mousey > 120 and mousey < 330 and luffyselect then
	drawbox (505, 290, 810, 80, white)
	Font.Draw ("Luffy", 600, 260, font5, white)
	drawfillbox (550, 100, 800, 130, 18)
	View.Update
    elsif mousex > 0 and mousex < maxx and mousey > 0 and mousey < maxy and luffyselect then
	drawbox (505, 290, 810, 80, 53)
	Font.Draw ("Luffy", 600, 260, font5, 14)
	drawfillbox (550, 100, 800, 130, 18)
	View.Update
    end if
    if mousex > 505 and mousex < 810 and mousey > 120 and mousey < 330 and not luffyselect then
	drawbox (505, 290, 810, 80, white)
	Font.Draw ("??????", 600, 260, font5, white)
	drawfillbox (550, 100, 800, 130, 18)
	View.Update
    elsif mousex > 0 and mousex < maxx and mousey > 0 and mousey < maxy and not luffyselect then
	drawbox (505, 290, 810, 80, 53)
	Font.Draw ("??????", 600, 260, font5, 14)
	drawfillbox (550, 100, 800, 130, 18)
	View.Update
    end if
    %The following code will make the actual selection for the characters if
    %the mouse is clicked in the range
    if mousex > 180 and mousex < 485 and mousey > 350 and mousey < 560 and button not= 0 then
	player := betsegaw
	select := true
    elsif mousex > 505 and mousex < 810 and mousey > 350 and mousey < 560 and button not= 0 then
	player := bharath
	select := true
    elsif mousex > 180 and mousex < 485 and mousey > 80 and mousey < 290 and button not= 0 then
	player := hossam
	select := true
    elsif mousex > 0 and mousex < 200 and mousey > 630 and mousey < maxy and button not= 0 then
	mainmenu
	select := true
    else
	select := false
    end if
    if mousex > 505 and mousex < 810 and mousey > 120 and mousey < 330 and button not= 0 and luffyselect then
	player := luffy
	select := true
    elsif mousex > 505 and mousex < 810 and mousey > 120 and mousey < 330 and button not= 0 and not luffyselect then
	drawbox (505, 290, 810, 80, white)
	Font.Draw ("Unavailable", 550, 100, font5, white)
    end if
    %Exits the loop when both conditions are met
    exit when button not= 0 and select
end loop
%Moves on the the next screen
include "G:/HBBGAME/Levels-Screens/PROLOGUE.t"
