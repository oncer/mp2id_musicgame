MXMLC = ./fcsh-wrap
OPTIONS = -debug=true -static-link-runtime-shared-libraries=true
FLIXEL = ../flixel
SRC = gm2.as\
	PlayState.as Level.as Config.as\
	Player.as Player1.as Player2.as Player3.as\
	Obstacle.as BumperObstacle.as Track.as\
	Powerup.as\
	TState.as\
	StartState.as\
	data/tiles.png\
	data/player1.png data/player2.png data/player3.png\
	data/player2_roll.png\
	data/bumper.png\
	data/background.png\
	data/readysetgo.png\
	data/powerup.png data/powerup_explosion.png\
	data/level1.png data/level2.png\
	data/level1_hl.png data/level2_hl.png\
	data/titlebg.png\
	data/startscreen.png
MAIN = gm2.as
SWF = gm2.swf

$(SWF) : $(SRC)
	$(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)

