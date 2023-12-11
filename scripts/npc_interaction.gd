extends Area3D
@export var key = "npc"
@export var label = ""
@export var dialogue = ""
@export var forced = false
# Called when the node enters the scene tree for the first time.
func action():
	Global.player.can_move = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/camp_scene.dialogue"), dialogue)
