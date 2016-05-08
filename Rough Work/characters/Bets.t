drawfillbox (0,0,maxx,maxy,18)
%Pants
drawfillbox (10,0,15,30,blue)
drawfillbox (17,0,22,30,blue)
%Torso
drawfillbox (10,30,22,60,white)
%Torso Outline
drawbox (10,30,22,60,black)
%Arms
drawfillbox (5,30,10,60,black)
drawfillbox (22,30,27,60,black)
%Afro
drawfilloval(17,75,12,12,black)
%Head
drawfilloval(17,70,10,10,135)
%Eyes
drawfilloval (13,70,2,2,black)
drawfilloval (21,70,2,2,black)
var hossam:int
hossam:=Pic.New(4,0,28,89)
Pic.Save(hossam,"Betsegaw.bmp")
