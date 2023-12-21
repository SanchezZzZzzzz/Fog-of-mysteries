extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Blink_anim.play("unconsciousness")

func _on_blink_anim_animation_finished(anim_name):
	#get_parent().get_node("Cutscene_animation").play("awakening")
	Global.player.can_move = false
	DialogueManager.show_example_dialogue_balloon(load("res://dialogues/tower_scene.dialogue"), "tower_monologue_1")
