drawfillbox (0, 0, maxx, maxy, 18)
%Pants
drawfillbox (9, 12, 15, 28, 55) %shorts
drawfillbox (17, 12, 23, 28, 55) %shorts
drawfillbox (10, 0, 15, 11, 66) %leg
drawfillbox (17, 0, 22, 11, 66) %leg
drawfillbox (9, 0, 15, 1, 170)
drawfillbox (17, 0, 23, 1, 170)
%shirt
drawfillbox (9, 28, 23, 43, 40)
%skin
drawfillbox (15, 28, 17, 43, 66)
%Torso Outline
drawbox (9, 28, 23, 43, black)
%Arms
drawfillbox (5, 28, 9, 43, 66)
drawfillbox (23, 28, 27, 43, 66)
%White parts of pants
drawfillbox (9, 27, 23, 28, white)
drawfillbox (9, 11, 15, 13, white)
drawfillbox (17, 11, 23, 13, white)
%hair
drawfilloval (17, 58, 12, 13, black)
%Head
drawfilloval (17, 53, 9, 11, 66)
%hat
Draw.ThickLine (1, 60, 33, 60, 3, 67) %  rim
drawfilloval (17, 65, 10, 6, 67) %  top
Draw.ThickLine (6, 62, 28, 62, 3, 40) %  stripe
%Eyes
drawfilloval (13, 53, 2, 2, black)
drawfilloval (21, 53, 2, 2, black)

var lockedchar : int
lockedchar := Pic.New (0, 0, 34, 73)
Pic.Save (lockedchar, "selectacharacterLUFFY.bmp")
