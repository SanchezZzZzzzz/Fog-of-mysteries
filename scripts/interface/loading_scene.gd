extends Control
var image_num : int = 2
var loading_status : int
var progress : Array[float]
@onready var loading_finished : Label = $Loading_finished
@onready var animation : AnimationPlayer = $Slides_animation
@onready var slides : TextureRect = $Slides
@onready var label_anim : AnimationPlayer = $Label_animation
func _ready():
	ResourceLoader.load_threaded_request(Global.new_loading_scene)
	
func _process(_delta):
	loading_status = ResourceLoader.load_threaded_get_status(Global.new_loading_scene, progress)
	$Slides_animation.play("Slide_animation")
	match loading_status:
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			pass
		ResourceLoader.THREAD_LOAD_LOADED:
			loading_finished.text = "Для продолжения нажмите любую кнопку"
			label_anim.play("label_blinker")
			if Input.is_anything_pressed():
				get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(Global.new_loading_scene))
		ResourceLoader.THREAD_LOAD_FAILED:
			loading_finished.text = "Кажется, произошла ошибка"


func _on_slides_animation_animation_finished(anim_name):
	var current_image = image_num % 3
	image_num += 1
	slides.texture = load(str("res://scenes/ui_scenes/Loading_slides/Screen" + str(current_image) + ".png"))
