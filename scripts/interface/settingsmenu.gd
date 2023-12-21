extends Control

@onready var option_button = $Resolution_container/Resolutions_list as OptionButton

const WINDOW_MODE_ARRAY : Array[String] = [
	"Полноэкранный режим",
	"Режим окна"
]
	

func _ready():
	#add_window_mode_items()
	#option_button.item_selected.connect(on_window_mode_selected)
	pass
	
	
func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)
	
func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Полноэкранный режим
			pass

		1: #Режим окна
			pass

func _on_window_mode_toggled(toggled_on):
	match toggled_on.toggle_mode:
		false: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
