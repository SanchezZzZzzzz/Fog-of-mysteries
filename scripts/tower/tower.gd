extends Node3D

func _ready():
	Global.pause(0)
	print("Initializing main scene...")
	Global.game = self
	Global.player = $Player
	Global.interface = $Interface
	Global.crosshair = $Interface/Crosshair
	Global.notification = $Interface/Notification
	Global.ingame_menu = $Ingame_menu
	$Player.can_move = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Global.pause(1)
		if get_tree().paused:
			$Ingame_menu.visible = 1
		else:
			$Ingame_menu.visible = 0


func _on_cutscene_animation_animation_finished(anim_name):
		pass


func _on_top_trigger_body_entered(body):
	if (body.name == "Player"):
		$Player.can_move = false
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/tower_scene.dialogue"), "tower_monologue_2")
