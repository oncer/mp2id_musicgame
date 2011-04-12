MXMLC = ./fcsh-wrap
OPTIONS = -debug=true -static-link-runtime-shared-libraries=true
FLIXEL = ../../flixel
SRC = Enemy.as GuitarMario.as PlayState.as Runner.as SoundBank.as\
      Sequence.as SoundPos.as
MAIN = GuitarMario.as
SWF = Game.swf

$(SWF) : $(SRC)
	$(MXMLC) $(OPTIONS) -sp $(FLIXEL) -o $(SWF) -- $(MAIN)

