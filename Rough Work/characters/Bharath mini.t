%Pants
drawfillbox (10,0,15,10,black)
drawfillbox (17,0,22,10,black)
%Torso
drawfillbox (10,10,22,25,24)
%Torso Outline
drawbox (10,10,22,25,black)
%Arms
drawfillbox (5,10,9,25,24)
drawfillbox (23,10,27,25,24)
%Hair
drawfillbox(8,40,26,49,black)
%Head
drawfilloval(17,35,9,10,42)
%Glasses
drawbox (9,32,16,37,black)
drawfillbox(10,33,15,36,gray)
drawline(17,35,20,35,black)
drawbox(19,32,26,37,black)
drawfillbox(20,33,24,36,gray)
var hossam:int
hossam:=Pic.New(4,0,28,49)
Pic.Save(hossam,"bharath.bmp")
