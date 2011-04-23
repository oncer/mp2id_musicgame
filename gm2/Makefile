MXMLC = ./fcsh-wrap
OPTIONS = -debug=true -static-link-runtime-shared-libraries=true
FLIXEL = ../flixel
SRC = gm2.as\
	PlayState.as Level.as Config.as\
	Player.as Player1.as Player2.as Player3.as\
	data/player1.png data/player2.png data/player3.png
MAIN = gm2.as
SWF = gm2.swf

$(SWF) : $(SRC)
	$(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)

