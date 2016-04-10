all:
	openscad  -o RpiPlayer_main.stl RpiPlayer_main.scad
	openscad  -o RpiPlayer_top.stl RpiPlayer_top.scad
	7z a RpiPlayer.stl.zip RpiPlayer_main.stl RpiPlayer_top.stl

clean:
	rm -f *.zip *.stl
