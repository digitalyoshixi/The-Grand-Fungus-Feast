extends Node2D

@onready var mush1path = preload("res://assets/mushroom1.tscn")
@onready var mush2path = preload("res://assets/mushroom2.tscn")

var mushroom1 
var mushroom2 
# Called when the node enters the scene tree for the first time.
func _ready():
	nextround()
	# listeners
	$Mushroom2.connect("mushroom_clicked", nextforest)
	$Mushroom1.connect("mushroom_clicked", nextforest)
	$Crumplednote/idcbutton.connect("idc_clicked",apathy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func nextround():
	mushroom1 = mush1path.instantiate()
	mushroom2 = mush2path.instantiate()
	add_child(mushroom1)
	add_child(mushroom2)

# the meters
var toxicmeter = 0
var hungermeter = 0
var neededhungers = 3
var neededpoisons = 3
var mushbouncefinal = true # last debounce. for safety

func nextforest():
	if mushbouncefinal:
		mushbouncefinal = false;
		$"Crunch SFX".play()
		# roll the dice. see if hunger or poison
		var rng = round(randf_range(1,10))
		if rng<=4:
			hungermeter+=40
			neededhungers -= 1
			if neededhungers == 0:
				victory()
			else:

				$Hungermeter.value = hungermeter
				$Crumplednote/PoisonScreen.visible = false
				$Crumplednote/HungerScreen.visible = true
				$Crumplednote/HungerScreen/HungerCount.text = str(neededhungers)
		
				$Crumplednote.visible = true
				await get_tree().create_timer(1.0).timeout
				$Crumplednote/idcbutton.visible = true
				# delete the mushrooms
				mushroom1.queue_free()
				mushroom2.queue_free()
				nextround()
		else:
			toxicmeter+=40
			neededpoisons -= 1
			if neededpoisons == 0:
				lose()
			else:
				
				$Toxicmeter.value = toxicmeter
				$Crumplednote/HungerScreen.visible = false
				$Crumplednote/PoisonScreen.visible = true
				$Crumplednote/PoisonScreen/PoisonCount.text = str(neededpoisons)
		
		
				$Crumplednote.visible = true
				await get_tree().create_timer(1.0).timeout
				$Crumplednote/idcbutton.visible = true
				# delete the mushrooms
				mushroom1.queue_free()
				mushroom2.queue_free()
				nextround()
		
		mushbouncefinal = true;
		
func apathy():
	$Crumplednote.visible = false
	
func victory():
	mushroom1.queue_free()
	mushroom2.queue_free()
	$Mushroom1/Mushhover.visible = false
	$Mushroom2/Mushhover2.visible = false
	$Crumplednote.visible = false
	$Crumplednote/idcbutton.visible = false
	$Victoryscreen.visible = true
	$ReplayButton.visible = true
		
func lose():
	mushroom1.queue_free()
	mushroom2.queue_free()
	$Mushroom1/Mushhover.visible = false
	$Mushroom2/Mushhover2.visible = false
	$Crumplednote.visible = false
	$Crumplednote/idcbutton.visible = false
	$Losescreen.visible = true
	$ReplayButton.visible = true
