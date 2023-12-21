extends Control



func _on_play_pressed():
	Global.go_to_next_scene("res://scenes/main_scene.tscn")


func _on_options_pressed():
	$Title.visible = false
	$Settings.visible = true


func _on_quit_pressed():
	get_tree().quit()


func _on_back_pressed():
	$Settings.visible = false
	$Title.visible = true
