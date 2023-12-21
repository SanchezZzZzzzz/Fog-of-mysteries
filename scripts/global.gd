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
var new_loading_scene: String
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
	
func go_to_next_scene(transist_to):
	new_loading_scene = transist_to
	get_tree().change_scene_to_file("res://scenes/ui_scenes/loading_scene.tscn")
