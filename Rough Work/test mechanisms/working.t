View.Set ("graphics:800;600,offscreenonly,nobuttonbar")
%%%%%%%%%%%%%%%%%%%%%%%%%%%VARIABLES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
var chars : array char of boolean
var hossam, hossamm : int
var x : int := 10
var y : int := 250
var velx : int := 0
var vely : int := 0
var groundheight := false
var ground := 0
var platform:=false
const gravity := 5
const runspeed := 5
const jumpspeed := 30
%%%%%%%%%%%%%%%%%%%%%%%%%%%DECLARATIONS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hossam := Pic.FileNew ("hossam.BMP")
hossamm := Pic.FileNew ("hossammotion.BMP")
%%%%%%%%%%%%%%%%%%%%%%%%%%%INITIAL SCREEN%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
procedure foreground
    drawfillbox (0, 0, maxx, 150, green)
    drawbox (0, 0, maxx, 150, blue)
    drawfillbox (210, 150, 250, 200, green)
    drawbox (210, 150, 250, 200, blue)
end foreground
Pic.Draw (hossam, x, y, picMerge)
foreground
View.Update
%%%%%%%%%%%%%%%%%%%%%%%%%%%INTERFACE CONTROL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
loop
    Pic.Draw (hossam, x, y, picMerge)
    View.Update
    cls
    if groundheight=false then
	vely -= gravity
	y += vely
    end if
    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) and groundheight then
	vely := jumpspeed
	y += vely
    end if
    if chars (KEY_RIGHT_ARROW) and x not= 775 then
	velx := runspeed
	x += velx
    elsif chars (KEY_LEFT_ARROW) and x >= 0 then
	velx := -runspeed
	x += velx
    else
	velx := 0
    end if
    foreground
    if View.WhatDotColor (x + 20, y + 20) = blue then
	velx := 0
	velx -= runspeed
	x += velx
    end if
    if View.WhatDotColor (x, y + 20) = blue then
	velx := 0
	velx += runspeed
	x += velx
    end if
    if View.WhatDotColor (x, y +5) = blue then
	vely := 0
	vely += gravity
	y += vely
	ground := y
	groundheight := true
    else
	groundheight := false
    end if
    if y <= ground then
	vely := 0
	y := ground
    end if
    % ground:=0
    delay (50)
    exit when y < -50
end loop
put "Game Over!"
