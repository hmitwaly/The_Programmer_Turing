View.Set ("graphics:800;600,offscreenonly,nobuttonbar")
%%%%%%%%%%%%%%%%%%%%%%%%%%%VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var chars : array char of boolean
var hossam, hossamm : int
var x : int := 500
var y : int := 250
var velx : int := 0
var vely : int := 0
var groundheight := false
const gravity := 5
const runspeed := 5
const jumpspeed := 40
var ground := 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%DECLARATIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hossam := Pic.FileNew ("hossam.bmp")
%%%%%%%%%%%%%%%%%%%%%%%%%%%INITIAL SCREEN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
procedure foreground
    drawfillbox (0, 0, 150, 150, green)
    drawfillbox (303, 0, maxx, 150, green)
    drawfillbox (210, 150, 250, 200, green)
    drawfillbox (100, 200, 200, 200, green)
    drawfillbox (600, 190, maxx, 200, green)
    drawfillbox (400, 150, 500, 200, green)
end foreground
%%%%%%%%%%%%%%%%%%%%%%%%%%%INTERFACE CONTROL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loop
    Pic.Draw (hossam, x, y, picMerge)
    View.Update
    cls
    foreground
    if groundheight=false then
	vely -= gravity
	y += vely
    end if
    if groundheight then
	ground := y
    end if


    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) and groundheight = true then
	vely := jumpspeed
	y += vely
    end if
    if chars (KEY_RIGHT_ARROW) and x not= 775 then
	velx := runspeed
	x += velx
    elsif chars (KEY_LEFT_ARROW) and x >= 0 then
	velx := -runspeed
	x += velx
    end if

    if View.WhatDotColor (x + 20, y + 50) = green then
	velx := 0
	velx -= runspeed
	x += velx
    end if
    if View.WhatDotColor (x + 5, y + 50) = green then
	velx := 0
	velx += runspeed
	x += velx
    end if
    if View.WhatDotColor (x + 5, y+5) = green then
	vely := 0
	vely += gravity
	y += vely
	groundheight := true
    elsif View.WhatDotColor (x + 5, y ) = 0 then
	groundheight := false
    end if
    if y < ground and groundheight=true then
	vely:=0
	y := ground
    end if
    delay (20)
    % exit when y < -50
end loop
put "Game Over!"
