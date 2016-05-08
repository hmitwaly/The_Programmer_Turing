drawfillbox (0,0,maxx,maxy,18)
%Pants
drawfillbox (10,0,17,32,black)
drawfillbox (19,0,26,32,black)
%Torso
drawfillbox (7,30,30,60,24)
%Torso Outline
drawbox (7,30,30,60,black)
%Arms
drawfillbox (1,30,6,60,24)
drawfillbox (31,30,36,60,24)
%Hair
drawfillbox(6,65,29,85,black)
%Head
drawfilloval(18,70,10,10,42)
%Glasses
drawbox (10,67,17,72,black)
drawfillbox(11,68,16,71,31)
drawline(17,70,20,70,black)
drawbox(20,67,27,72,black)
drawfillbox(21,68,26,71,31)
var hossam:int
hossam:=Pic.New(0,0,35,89)
Pic.Save(hossam,"Bharath.bmp")
