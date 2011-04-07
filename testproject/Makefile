MXMLC = ./fcsh-wrap
OPTIONS = -debug=true -static-link-runtime-shared-libraries=true
FLIXEL = ../flixel
SRC = Main.as
MAIN = Main.as
SWF = Game.swf

$(SWF) : $(SRC)
	$(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)
