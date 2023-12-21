extends Control
var debug_menu = true		
# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("debug"):
		if debug_menu:
			$FPS.visible = false
			debug_menu = false
		else:
			$FPS.visible = true
			debug_menu = true
func _ready():
	print("Initializing interface...")
func _process(delta):	
	if debug_menu:
		$FPS.text = str(int(Engine.get_frames_per_second()))
	else:
		pass
func set_cross_label(s=''):
	$Crosshair/Label.text = s
func show_notification(message):
	$Notification.text = message
	$Interface_animation.play("Notification animation")
	$Notification_timer.start()
	await $Notification_timer.timeout
	$Notification.text = ""
	
