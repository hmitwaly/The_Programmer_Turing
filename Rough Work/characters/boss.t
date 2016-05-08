var boss:int
boss := Pic.FileNew ("javalogo.bmp")
%Pants
drawfillbox (10,0,15,10,black)
drawfillbox (17,0,22,10,black)
%Torso
drawfillbox (10,10,22,25,black)
%Torso Outline
drawbox (10,10,22,25,black)
%Arms
drawfillbox (5,10,10,25,black)
drawfillbox (22,10,27,25,black)
Pic.Draw (boss,7, 25, picMerge)
var hossam:int
hossam:=Pic.New(4,0,28,49)
Pic.Save(hossam,"jboss.bmp")
