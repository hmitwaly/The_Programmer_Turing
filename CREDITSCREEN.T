%CREDITS SCREEN
% Sets the screen to 1006X660 and makes it offscreenonly.
View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
%  Background colour
drawfillbox (0, 0, maxx, maxy, 18)
drawbox (0, 0, 1006, 660, 53)
%All the text on the screen
Font.Draw ("Credits ", 410, 600, font4, 53)
Font.Draw ("<-- Go Back", 17, 630, font6, brightred)
Font.Draw ("Betsegaw ------ Screen Designer/Creator", 190, 450, font5, white)
Font.Draw ("Bharath ------ Programmer", 285, 400, font5, white)
Font.Draw ("Hossam ------ Lead Programmer", 250, 350, font5, white)
Font.Draw ("**THANKS FOR PLAYING!!!**", 270, 200, font4, brightgreen)
View.Update
loop
    % The mousewhere procedure is used to get current information about
    % the status of the mouse. mousex and mousey are set to the current location
    % of the mouse cursor.
    mousewhere (mousex, mousey, button)
    % If the the mouse is over the certain range and if the left mouse button is clicked
    % It wil make select true.
    if mousex > 0 and mousex < 200 and mousey > 630 and mousey < maxy and button not= 0 then
	select := true
    else
	select := false
    end if
    % Will exit the loop when the button is clicked.
    exit when button not= 0 and select
end loop
%Will go the main menu procedure
mainmenu
