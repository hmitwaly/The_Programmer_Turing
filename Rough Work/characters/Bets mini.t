%Pants
drawfillbox (10,0,15,10,blue)
drawfillbox (17,0,22,10,blue)
%Torso
drawfillbox (10,10,22,25,red)
%Torso Outline
drawbox (10,10,22,25,black)
%Arms
drawfillbox (5,10,10,25,black)
drawfillbox (22,10,27,25,black)
%Afro
drawfilloval(17,40,12,10,black)
%Head
drawfilloval(17,35,9,10,135)
%Eyes
drawfilloval (13,35,2,2,black)
drawfilloval (21,35,2,2,black)
var hossam:int
hossam:=Pic.New(4,0,28,49)
Pic.Save(hossam,"betsegaw.bmp")
