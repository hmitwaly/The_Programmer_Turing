View.Set ("graphics:1006;660,nobuttonbar")
var exsize, eysize : int
var epic : int
var ecount, enemies := 4
var ex : array 1 .. enemies of int
var ey : array 1 .. enemies of int
var edead : array 1 .. enemies of boolean
epic := Pic.FileNew ("enemie.bmp")
loop
    %Enemies starting position
    ex (1) := 100
    ex (2) := 500
    ex (3) := 800
    ex (4) := 900
    ey (1) := 100
    ey (2) := 200
    ey (3) := 600
    ey (4) := 300
    ecount := 4
    %Moving the enemies
    for i : 1 .. enemies
	edead (i) := false
	Pic.Draw (epic, ex (i), ey (i), picMerge)
    end for
    for i : 1 .. enemies
	if not edead (i) then
	    ex (i) += 1
	end if
    end for

    %Drawig the enemies


    %Moving Enemies
    for i : 1 .. enemies
	if View.WhatDotColour (round (ex (i)), round (ey (i))) = 54 then
	    ex (i) *= -1
	end if
    end for
end loop
