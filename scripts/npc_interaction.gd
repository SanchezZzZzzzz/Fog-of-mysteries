extends Area3D
@export var key = "npc"
@export var label = ""
@export var dialogue = ""
@export var voiceover_path: String
@export var forced = false
@export var voice_node = ""
# Called when the node enters the scene tree for the first time.
func action():
	Global.player.can_move = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/camp_scene.dialogue"), dialogue, [], voiceover_path, get_node(voice_node))
