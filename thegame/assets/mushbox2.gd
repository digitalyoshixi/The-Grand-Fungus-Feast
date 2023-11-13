extends Area2D

signal mushroom_clicked
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var mouseon = false

func _mouse_enter():
	mouseon = true
	$Mushhover2.visible = true
func _mouse_exit():
	mouseon = false
	$Mushhover2.visible = false
func _input(event):
	if Input.is_action_pressed("ui_leftMouseClick"):
		# destination = get_global_mouse_position()
		if mouseon:
			
			mouseon = false
			emit_signal("mushroom_clicked")
				
	
