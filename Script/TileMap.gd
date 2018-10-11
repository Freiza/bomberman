extends TileMap


var tileset

func _ready():
	tileset = get_tileset()
	for x in range(0,50):
		for y in range(0,25):
			if(x%2==1) and (y%2==1):
				set_cell(x,y,tileset.find_tile_by_name("IndestructibleWall"))
			else:
				if x>3 or y>3:
					if randi() % 3==1:
						pass
					else:
						set_cell(x,y,tileset.find_tile_by_name("Wall"))



#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
