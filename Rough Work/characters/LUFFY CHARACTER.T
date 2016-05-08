
%Pants
drawfillbox (10, 3, 15, 10, 55)
drawfillbox (17, 3, 22, 10, 55)
drawfillbox (11, 0, 14, 2, 66)
drawfillbox (18, 0, 21, 2, 66)
%shirt
drawfillbox (9, 10, 23, 25, 40)
%skin
drawfillbox (15, 10, 17, 25, 66)
%Torso Outline
drawbox (10, 10, 22, 25, black)
%Arms
drawfillbox (5, 10, 10, 25, 66)
drawfillbox (22, 10, 27, 25, 66)
%hair
drawfilloval (17, 40, 12, 10, black)
%Head
drawfilloval (17, 35, 9, 10, 66)
%hat
Draw.ThickLine (1, 41, 33, 41, 3, 67) %  rim
drawfilloval (17, 46, 10, 6, 67) %  top
Draw.ThickLine (6, 43, 28, 43, 3, 40) %  stripe
%Eyes
drawfilloval (13, 35, 2, 2, black)
drawfilloval (21, 35, 2, 2, black)
%shoes

var lockedchar : int
lockedchar := Pic.New (0, 0, 34, 53)
Pic.Save (lockedchar, "luffy.bmp")
