extends Node3D
@onready var world
@onready var player
@onready var game
@onready var interface
@onready var crosshair
@onready var notification
@onready var inventory
@onready var vehicle
@onready var ingame_menu
const sensitivity = 0.3

@onready var item = {
	label = "",
	image = null
}

func pause(set_pause = true):
	get_tree().paused = set_pause
	if set_pause:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
