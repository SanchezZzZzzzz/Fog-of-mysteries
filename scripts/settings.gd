extends Control
		
	#var is_fullscreen = false

		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)  

	
#func _ready():
	# Назначьте метод toggle_fullscreen на событие "pressed" кнопки
#	$WindowFull.connect("pressed", self, "toggle_fullscreen")

#func toggle_fullscreen():
	# Получаем текущий статус полноэкранного режима
#	var is_fullscreen = OS.get_window_fullscreen()

	# Инвертируем статус (переключаем между полноэкранным и оконным режимом)
#	OS.set_window_fullscreen(!is_fullscreen)

#Переход на основное меню
func _on_back_pressed():
	get_tree().change_scene_to_file('res://menu.tscn')
	
#Выпадающее меню настроек режимов окна
@onready var option_button = $HBoxContainerWindow/OptionButton as OptionButton




const WINDOW_MODE_ARRAY : Array[String] = [
	"Полноэкранный режим",
	"Режим окна"
]
	

func _ready():
	add_window_mode_items()
	option_button.item_selected.connect(on_window_mode_selected)
	
	
	
func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		option_button.add_item(window_mode)
	
func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Полноэкранный режим
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			#if get_window().size < Vector2i(1500, 800):
				#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		1: #Режим окна
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
			#if DisplayServer.WINDOW_MODE_FULLSCREEN:
				#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN, false)
				#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
				#get_window().size = Vector2i(900, 500)
	
#--------------------------------------------------------------------------------------------



	
	

	

	
	
	
	
	
	
