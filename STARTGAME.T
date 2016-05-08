%
%         * * * * * * * * * * * * * * * * * * * * * * * * * *
%         *           Bharath Krishnan, Hossam Mitwaly,     *
%         *                    Betsegaw Tesfai              *
%         *                                                 *
%         *                  Ms. Galati  ICS3U1             *
%         *                  January 23, 2013               *
%         *                  Stephen Leacock CI             *
%         *                                                 *
%         *                  Final Culminating              *
%         * * * * * * * * * * * * * * * * * * * * * * * * * *
%
%                Program Description

%The purpose of the program is to start and run a game in Turing.
%This program will have you select and control a character and
%to interact with its environment. The user will have to go
%through a series of ordeals and finish the game by defeating
%each level's respective boss. The story line is about the main
%character wanting to learn the 3 main programming languages which
%are Turing, Python and Java.This program has a total of 3 levels
%and 3 boss rooms.  At the beginning of the program the user will have
%to select which option they would want to do.
%They can choose to immediately to start the game, enter cheats,
%view the credits screen or quit. If they choose to start the game
%they will be given a choice to select a character of their choosing.
%Once they select the character they will go through the game and will
%be given 3 lives once the 3 lives have run out they will be sent to the
%main menu again. At first they will be sent to the prologue screen and
%learn the instructions of the game and be introduced to the story line.
%Once they complete the prologue screen they will be sent to level one
%where they will have to overcome a series of obstacles and will be sent
% to the boss room. They will have to defeat the language of Turing in order
% to "learn" it. Once they defeat Turing they will be sent to level 2 where
%there is a new kind of obstacle, enemies.  The user will have to press a
%button to open the door and go through it. But there are enemies that
%are preventing you to do so. Once you get through the door you will
%have to defeat the boss of the level, python. After you defeat python
%you are sent to level 3 where you have to make a number of jumps, but
%at the bottom there are a set of spikes which are deadly and will kill
% you in one touch. After that, you are sent to the final boss, java which
% is the fiercest language.  After you defeat the boss, you are sent back
%to your house where Ms. Galati, the programming teacher will congratulate
% you for your hard work.  Then the game ends and the credits screen will
%appear.

View.Set ("graphics:1006;660,offscreenonly,nobuttonbar")
var cheatword : string
% Sets the number of enemies to 2.
var ecount, enemies := 2
% Gives the number of enemies 1 life.
var elives : array 1 .. enemies of int
% Sets the x-coordinate for each of the enemies created in level 2.
var ex : array 1 .. enemies of int
% Sets the y-coordinate for each of the enemies created in level 2.
var ey : array 1 .. enemies of int
%Records the key the user has entered
var keys : array char of boolean
const gravity := 5
const runspeed := 5
const jumpspeed := 30
var velx, evelx : int := 0
var vely : int := 0
var lives := 1000000
var bosslives := 0
var hit := 0
var a := 0
var speed := 0
%%Booleans%%
var groundheight := false
var opendoor := false
var select, quitt := false
var luffyselect := false
var bossplatform := false
var x, bossx, msgx : int
var y, bossy : int
var winID : int
winID := Window.Open ("position:0;0,graphics: 1006;660")
% Declares The mouse variables of x and y. Also decalares a Button variable
% where 0= false 1=true(left click) 2=true(right click)
var mousex, mousey, button : int
var hossam, betsegaw, bharath, charhit, tboss, pboss, jboss, MsGalati : int
var hossamo, betsegawo, bharatho, lockedchar, epic, luffy, luffyo : int
%  Font variables
var font1, font2, font3, font4, font5, font6, font7, font8 : int
font1 := Font.New ("DisposableDroid BB:100:")
font2 := Font.New ("DisposableDroid BB:60:")
font3 := Font.New ("DisposableDroid BB:43:")
font4 := Font.New ("DisposableDroid BB:39:")
font5 := Font.New ("DisposableDroid BB:30:")
font6 := Font.New ("DisposableDroid BB:20:")
font7 := Font.New ("DisposableDroid BB:25:")
font8 := Font.New ("DisposableDroid BB:65:")
%  Characters
hossamo := Pic.FileNew ("Pictures/hossam.bmp")
betsegawo := Pic.FileNew ("Pictures/Betsegaw.bmp")
bharatho := Pic.FileNew ("Pictures/Bharath.bmp")
lockedchar := Pic.FileNew ("Pictures/lockedcharacter.bmp")
hossam := Pic.FileNew ("Pictures/hossam mini.bmp")
betsegaw := Pic.FileNew ("Pictures/betsegaw mini.bmp")
bharath := Pic.FileNew ("Pictures/bharath mini.bmp")
charhit := Pic.FileNew ("Pictures/characterhit.bmp")
tboss := Pic.FileNew ("Pictures/tboss.bmp")
pboss := Pic.FileNew ("Pictures/pboss.bmp")
jboss := Pic.FileNew ("Pictures/jboss.bmp")
epic := Pic.FileNew ("Pictures/enemy.bmp")
luffy := Pic.FileNew ("Pictures/luffy mini.bmp")
luffyo := Pic.FileNew ("Pictures/luffy.bmp")
MsGalati := Pic.FileNew ("Pictures/MsGalati.bmp")
%Default Character
var player : int := hossam
%Process for the music of all the levels
process titlemusic
    Music.PlayFileLoop ("Music/Need For Madness Soundtrack - Stage 9  Eagles .mp3")
end titlemusic
process selectionmusic
    Music.PlayFileLoop ("Music/Guile Theme (SNES).mp3")
end selectionmusic
process prologuemusic
    Music.PlayFileLoop ("Music/One Piece Original SoundTrack - Luffy's Pace.mp3")
end prologuemusic
process level1music
    Music.PlayFileLoop ("Music/Castlevania - Stage 1 (NES) Music.mp3")
end level1music
process level1bossmusic
    Music.PlayFileLoop ("Music/Blaster Master (NES) Music - Area 6.mp3")
end level1bossmusic
process level2music
    Music.PlayFileLoop ("Music/Ninja Gaiden (NES) Music - Act 4 Part 2.mp3")
end level2music
process level2bossmusic
    Music.PlayFileLoop ("Music/Batman (NES) - Boss Theme.mp3")
end level2bossmusic
process level3music
    Music.PlayFileLoop ("Music/Gyromite Music (NES) - Game A BGM.mp3")
end level3music
process level3bossmusic
    Music.PlayFileLoop ("Music/Blaster Master (NES) Music - Area 4.mp3")
end level3bossmusic
process victorymusic
    Music.PlayFile ("Music/Othello (NES) Music - Game Menu.mp3")
end victorymusic
process bossdefeatmusic
    Music.PlayFile ("Music/Pokémon Gold_Silver_Crystal Music - Gym Leader Defeated (Full).mp3")
end bossdefeatmusic
% Draws Level 1
proc level1
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 29)
    %  Orange platforms
    drawfillbox (0, 630, 1006, 660, 42)     %  Celing
    drawfillbox (0, 0, 400, 20, 42)     %  floor 1
    drawfillbox (0, 100, 50, 660, 42)     %  wall 1
    drawfillbox (300, 0, 400, 500, 42)     %  wall 2
    drawfillbox (0, 100, 190, 120, 42)     %  floor 2
    drawfillbox (130, 200, 300, 220, 42)     %  floor 3
    drawfillbox (0, 300, 200, 320, 42)     %  floor 4
    drawfillbox (130, 400, 300, 420, 42)     %floor 5
    drawfillbox (770, 0, 1006, 20, 42)     %flor 6 lower
    %  SkyBlocks
    drawfillbox (450, 310, 520, 380, 42)     %  skyblock 1
    drawfillbox (570, 250, 640, 320, 42)     %  skyblock 2
    drawfillbox (690, 200, 760, 270, 42)     %  skyblock 3
    Font.Draw ("LEVEL 1", 450, 640, font6, black)
end level1
%Draws Level 1 Boss map
proc level1boss
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 29)
    %  Walls/floors/celings
    drawfillbox (0, 0, 1006, 20, 42) %  floor 1
    drawfillbox (0, 130, 20, 660, 42) %  wall 1
    drawfillbox (0, 630, 1006, 660, 42) %  celing 1
    drawfillbox (976, 660, 1006, 130, 42) %  wall 2
    drawfillbox (976, 20, 1006, 130, black) %door
    %  Staircase 1
    drawfillbox (105, 20, 310, 60, 42) %  1st step
    drawfillbox (155, 60, 310, 90, 42) %  2nd step
    drawfillbox (205, 90, 310, 120, 42) %  3rd step
    %  Staircase 2
    drawfillbox (901, 20, 696, 60, 42) %  1st step
    drawfillbox (851, 60, 696, 90, 42) %  2nd step
    drawfillbox (801, 90, 696, 120, 42) %  3rd step
    Font.Draw ("LEVEL 1", 450, 640, font6, black)
end level1boss
%Draws level 2
proc level2
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 92)
    Font.Draw ("LEVEL 2", 450, 630, font6, black)
    %  Walls/floors/celings
    drawfillbox (0, 0, 1006, 20, 54) %  floor 1
    drawfillbox (0, 130, 10, 660, 54) %  wall 1
    drawfillbox (0, 650, 1006, 660, 54) %  celing 1
    drawfillbox (996, 130, 1006, 660, 54) %  wall 2
    drawfillbox (490, 20, 520, 50, 54) %floorblock 1
    drawfillbox (800, 20, 830, 50, 54) %floorblock 2
    drawfillbox (996, 130, 1006, 20, 7) %  Door
    %  SkyPlatforms
    drawfillbox (100, 100, 200, 120, 54) %  1
    drawfillbox (240, 120, 260, 140, 54) %  2 (block)
    drawfillbox (300, 160, 400, 180, 54) %  3
    drawfillbox (440, 200, 460, 220, 54) %  4 (block)
    drawfillbox (500, 240, 600, 260, 54) %  5
    drawfillbox (640, 280, 660, 300, 54) %  6 (block)
    drawfillbox (700, 320, 800, 340, 54) %  7
    drawfillbox (840, 360, 860, 380, 54) %  8 (block)
    drawfillbox (900, 400, 1000, 420, 54) %  9
    drawfillbox (700, 470, 820, 490, 54) %  11
    drawfillbox (870, 500, 890, 520, 54) %  10 (block)
    drawfillbox (950, 420, 1000, 460, 54) %helping block
    %Button
    drawfilloval (40, 510, 10, 10, brightred)
    drawoval (40, 510, 10, 10, 7)
    %  Long SkyPlatform
    drawfillbox (0, 470, 640, 490, 54)
    %  block
    drawfillbox (290, 490, 320, 520, 54)
end level2
%Draws level 2 boss map
proc level2boss
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 92)
    Font.Draw ("LEVEL 2", 450, 630, font6, black)
    %  Walls/floors/celings
    drawfillbox (0, 0, 1006, 20, 54) %  floor 1
    drawfillbox (0, 90, 10, 660, 54) %  wall 1
    drawfillbox (0, 650, 1006, 660, 54) %  celing 1
    drawfillbox (996, 660, 1006, 90, 54) %  wall 2
    drawfillbox (190, 0, 230, 515, 54) %  wall 3
    drawfillbox (996, 20, 1006, 130, 54) %door
    %  Sky platforms
    drawfillbox (120, 70, 230, 95, 54) %  1
    drawfillbox (0, 140, 80, 165, 54) %  2
    drawfillbox (120, 210, 230, 235, 54) %  3 (short)
    drawfillbox (0, 280, 80, 305, 54) %  4
    drawfillbox (120, 350, 230, 375, 54) %  5**
    drawfillbox (0, 420, 80, 445, 54) %  6
    drawfillbox (120, 490, 230, 515, 54) %  7 (short)
end level2boss
%Draws level 3
proc level3
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 31)
    Font.Draw ("LEVEL 3", 450, 640, font6, black)
    %  Walls/floors/celings
    drawfillbox (0, 0, 1006, 10, 54) %  floor 1
    drawfillbox (0, 100, 10, 660, 54) %  wall 1
    % drawfillbox (0, 655, 1006, 660, 54) %  celing 1
    drawfillbox (996, 0, 1006, 570, 54) %  wall 2
    drawfillbox (940, 10, 1006, 60, 54) %  Groundblock 1
    %  SkyPlatforms/blocks
    %  2nd level
    drawfillbox (11, 120, 240, 140, 42) %  platform 1
    drawfillbox (300, 120, 350, 140, 42) %  skyblock 1
    drawfillbox (410, 120, 460, 140, 42) %  skyblock 2
    drawfillbox (520, 120, 570, 140, 42) %  skyblock 3
    drawfillbox (630, 120, 680, 140, 42) %  skyblock 4
    drawfillbox (740, 120, 906, 140, 42) %  platform 2
    drawfillbox (11, 140, 66, 190, 42) %  Groundblock 2
    %  3rd level
    drawfillbox (1006, 250, 740, 270, 54) %  Platform 3
    drawfillbox (630, 250, 680, 270, 54) %  skyblock 5
    drawfillbox (520, 250, 570, 270, 54) %  skyblock 6
    drawfillbox (410, 250, 460, 270, 54) %  skyblock 7
    drawfillbox (300, 250, 350, 270, 54) %  skyblock 8
    drawfillbox (240, 250, 100, 270, 54) %  platform 4
    drawfillbox (940, 270, 1006, 320, 54) %  Groundblock 3
    %  4th level
    drawfillbox (11, 380, 240, 400, 42) %  platform 5
    drawfillbox (300, 380, 350, 400, 42) %  skyblock 9
    drawfillbox (410, 380, 460, 400, 42) %  skyblock 10
    drawfillbox (520, 380, 570, 400, 42) %  skyblock 11
    drawfillbox (630, 380, 680, 400, 42) %  skyblock 12
    drawfillbox (740, 380, 906, 400, 42) %  platform 6
    drawfillbox (11, 400, 66, 450, 42) %  Groundblock 4
    %  5th level
    drawfillbox (240, 510, 100, 530, 54) %  platform 7
    drawfillbox (300, 510, 350, 530, 54) %  skyblock 9
    drawfillbox (410, 510, 460, 530, 54) %  skyblock 10
    drawfillbox (520, 510, 570, 530, 54) %  skyblock 11
    drawfillbox (630, 510, 680, 530, 54) %  skyblock 12
    drawfillbox (740, 510, 1006, 530, 54) %  platform 6
    drawfillbox (940, 530, 1006, 570, 54) %  Groundblock 5
    %  Spikes
    Draw.ThickLine (250, 9, 270, 30, 3, 54) %  Left line (1)
    Draw.ThickLine (290, 9, 270, 30, 3, 54) %  Right line (1)
    drawfill (255, 11, 54, 54) %  Spike fill
    Draw.ThickLine (360, 9, 380, 30, 3, 54) %  Left line (2)
    Draw.ThickLine (400, 9, 380, 30, 3, 54) %  Right line (2)
    drawfill (365, 11, 54, 54) %  Spike fill
    Draw.ThickLine (470, 9, 490, 30, 3, 54) %  Left line (3)
    Draw.ThickLine (510, 9, 490, 30, 3, 54) %  Right line (3)
    drawfill (475, 11, 54, 54) %  Spike fill
    Draw.ThickLine (580, 9, 600, 30, 3, 54) %  Left line (4)
    Draw.ThickLine (620, 9, 600, 30, 3, 54) %  Right line (4)
    drawfill (585, 11, 54, 54) %  Spike fill
    Draw.ThickLine (690, 9, 710, 30, 3, 54) %  Left line (5)
    Draw.ThickLine (730, 9, 710, 30, 3, 54) %  Right line (5)
    drawfill (695, 11, 54, 54) %  Spike fill
end level3
%Draws Level 3 Boss map
proc level3boss
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 31)
    Font.Draw ("LEVEL 3", 450, 630, font6, black)
    %  Walls/floors/celings
    drawfillbox (0, 130, 10, 660, 54) %  wall 1
    drawfillbox (0, 650, 1006, 660, 54) %  celing 1
    drawfillbox (996, 660, 1006, 0, 54) %  wall 2
    %  Ground platform
    drawfillbox (0, 0, 180, 50, 54)
    %  Lava
    drawfillbox (181, -100, 996, 40, 12)
    %  SkyBlocks/Skysticks
    drawfillbox (200, 70, 240, 100, 54) %  1st block
    drawfillbox (280, 90, 287, 120, 54) %  1st stick
    drawfillbox (327, 110, 367, 140, 54) %  2nd block
    drawfillbox (407, 130, 414, 160, 54) %  2nd stick
    drawfillbox (454, 150, 494, 180, 54) %  3rd block
    drawfillbox (534, 170, 541, 200, 54) %  3rd stick
    drawfillbox (581, 190, 621, 220, 54) %  4th block
    drawfillbox (661, 210, 668, 240, 54) %  4th stick
    drawfillbox (701, 230, 741, 260, 54) %  5th block
    drawfillbox (781, 250, 788, 280, 54) %  5th stick
    drawfillbox (828, 270, 868, 300, 54) %  6th block

    drawfillbox (890, 300, 995, 330, 54) %  base platform
    drawfillbox (890, 410, 910, 470, 54) %  left wall
    drawfillbox (996, 360, 970, 380, 54) %  1st block
    drawfillbox (910, 410, 936, 430, 54) %  2nd block
    drawfillbox (910, 460, 761, 470, 54) %  short platform
    %  Boss platform
    drawfillbox (100, 460, 700, 470, 54) %  boss platform
end level3boss
%draws only the boss platform
proc level3bossbattle
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 31)
    %  Walls/floors/celings
    drawfillbox (0, 130, 10, 660, 54) %  wall 1
    drawfillbox (0, 650, 1006, 660, 54) %  celing 1
    drawfillbox (996, 660, 1006, 0, 54) %  wall 2
    %  Lava
    drawfillbox (0, -100, 996, 40, 12)
    %  Boss platform
    drawfillbox (100, 460, 700, 470, 54) %  boss platform
    Font.Draw ("LEVEL 3", 450, 630, font6, black)
end level3bossbattle
% Draws the victory screen
proc victorylevel
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
    %  School
    drawfillbox (580, 16, 1005, 250, 27) %  box
    drawbox (580, 16, 1005, 250, black) %  box ourline
    % Top layer of windows
    drawbox (820, 233, 880, 180, black) %  4th window
    drawbox (930, 233, 990, 180, black) %  3rd window
    drawbox (710, 233, 770, 180, black) %  2nd window
    drawbox (600, 233, 660, 180, black) %  1st window
    % bottom layer of windows
    drawbox (820, 153, 880, 100, black) %  4th window
    drawbox (930, 153, 990, 100, black) %  3rd window
    drawbox (710, 153, 770, 100, black) %  2nd window
    drawbox (600, 153, 660, 100, black) %  1st window
    drawbox (740, 17, 794, 90, black) %  Left Door
    drawfilloval (785, 50, 2, 2, black) %  Door handle
    drawbox (796, 17, 850, 90, black) %  Right Door
    drawfilloval (805, 50, 2, 2, black) %  Door handle
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
end victorylevel
% Makes the main menu
proc mainmenu
% Plays the music and allows the rest of the program to run
    fork titlemusic
    lives := 3
    %  Background colour
    drawfillbox (0, 0, maxx, maxy, 18)
    %  Outter Lines
    Draw.ThickLine (0, 0, maxx, 0, 9, 43) %  Bottom line
    Draw.ThickLine (0, 660, maxx, 660, 9, 43) %  Top line
    Draw.ThickLine (0, 0, 0, maxy, 9, 43) %  Left Line
    Draw.ThickLine (1005, 0, 1005, maxy, 9, 43) %  Right Line
    %  Title
    Font.Draw ("PR0GRAMM3R", 180, 500, font1, white) %  Programmer
    Font.Draw ("TH3", 440, 600, font2, 43) %  The
    %  Line
    Draw.ThickLine (350, 558, 326, 510, 10, white) %  Line across the 0
    loop
	% The mousewhere procedure is used to get current information about
	% the status of the mouse. mousex and mousey are set to the current location
	% of the mouse cursor.
	mousewhere (mousex, mousey, button)
	%GLOW
	% IF the mouse x's and y's are inbetween the range it will cause the range
	% to change colours
	if mousex > 380 and mousex < 650 and mousey > 330 and mousey < 370 then
	    Font.Draw ("Start Game", 380, 330, font3, brightblue)
	    View.Update
	else
	    Font.Draw ("Start Game", 380, 330, font3, brightred)
	    View.Update
	end if
	if mousex > 422 and mousex < 600 and mousey > 280 and mousey < 320 then
	    Font.Draw ("Cheats", 422, 280, font3, brightblue)
	    View.Update
	else
	    Font.Draw ("Cheats", 422, 280, font3, brightred)
	    View.Update
	end if
	if mousex > 412 and mousex < 600 and mousey > 230 and mousey < 270 then
	    Font.Draw ("Credits", 415, 230, font3, brightblue)
	    View.Update
	else
	    Font.Draw ("Credits", 415, 230, font3, brightred)
	    View.Update
	end if
	if mousex > 457 and mousex < 600 and mousey > 180 and mousey < 220 then
	    Font.Draw ("Quit", 457, 180, font3, brightblue)
	    View.Update
	else
	    Font.Draw ("Quit", 457, 180, font3, brightred)
	    View.Update
	end if
	%ACTUAL SELECTION
	% if the user clicks the mouse inbetween the range it will activate the procedure.
	if mousex > 380 and mousex < 650 and mousey > 330 and mousey < 350 and button not= 0 then
	    select := true
	    % the include command is used to copy parts of other programs. In this case when the button is
	    % pressed it will go to another file to exectute that part of the code.
	    include "SELECTIONSCREEN.t"
	elsif mousex > 422 and mousex < 600 and mousey > 280 and mousey < 320 and button not= 0 then
	    select := true
	    include "CHEATSCREEN.t"
	elsif mousex > 412 and mousex < 600 and mousey > 230 and mousey < 270 and button not= 0 then
	    select := true
	    include "CREDITSCREEN.t"
	elsif mousex > 457 and mousex < 600 and mousey > 180 and mousey < 220 and button not= 0 then
	    quitt := true
	else
	    select := false
	    quitt := false
	end if
	if quitt = true then
	    %Stops the music
	    Music.PlayFileStop
	    exit
	end if
	exit when button not= 0 and select
    end loop
end mainmenu
if a < 1 then
    mainmenu
end if
%Closes the window that is declared in the variable winID.
Window.Close (winID)
