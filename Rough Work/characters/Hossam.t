drawfillbox (0,0,maxx,maxy,18)
%Pants
drawfillbox (10,0,15,30,blue)
drawfillbox (17,0,22,30,blue)
%Torso
drawfillbox (10,30,22,55,red)
%Arms
drawfillbox (5,30,10,45,66)
drawfillbox (22,30,27,45,66)
drawfillbox (5,45,10,55,red)
drawfillbox (22,45,27,55,red)
%Hair
drawfillbox(8,70,26,79,207)
%Head
drawfilloval(17,65,9,10,66)
%Eyes
drawfilloval (13,65,2,2,black)
drawfilloval (21,65,2,2,black)
var hossam:int
hossam:=Pic.New(4,0,28,79)
Pic.Save(hossam,"hossam.bmp")
