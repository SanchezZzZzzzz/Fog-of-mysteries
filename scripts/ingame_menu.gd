extends Control


func _on_continue_pressed():
	Global.pause(0)
	Global.ingame_menu.visible = 0
func _on_exit_to_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
func _on_exit_to_desktop_pressed():
	get_tree().quit()

func _on_continue_mouse_entered():
	$Button_press.play()
	
func _on_settings_mouse_entered():
	$Button_press.play()

func _on_exit_to_menu_mouse_entered():
	$Button_press.play()

func _on_exit_to_desktop_mouse_entered():
	$Button_press.play()
