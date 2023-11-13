extends Sprite2D

const images = [preload("res://mushrooms/1.png"),
				preload("res://mushrooms/2.png"),
				preload("res://mushrooms/3.png"),
				preload("res://mushrooms/4.png"),
				preload("res://mushrooms/5.png"),
				preload("res://mushrooms/6.png"),
				preload("res://mushrooms/7.png"),
				preload("res://mushrooms/8.png"),
				preload("res://mushrooms/9.png")
				]

# Called when the node enters the scene tree for the first time.
func _ready():
	set_texture(images[round(randf_range(0,len(images)-1))])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


