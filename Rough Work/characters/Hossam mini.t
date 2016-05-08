%Pants
drawfillbox (10,0,15,10,blue)
drawfillbox (17,0,22,10,blue)
%Torso
drawfillbox (10,10,22,25,red)
%Arms
drawfillbox (5,10,10,15,66)
drawfillbox (22,10,27,15,66)
drawfillbox (5,15,10,25,red)
drawfillbox (22,15,27,25,red)
%Hair
drawfillbox(8,40,26,49,207)
%Head
drawfilloval(17,35,9,10,66)
%Eyes
drawfilloval (13,35,2,2,black)
drawfilloval (21,35,2,2,black)
var hossam:int
hossam:=Pic.New(4,0,28,49)
Pic.Save(hossam,"hossam.bmp")
