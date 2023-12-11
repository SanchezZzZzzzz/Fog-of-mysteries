extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Initializing interface...")

func set_cross_label(s=''):
	$Crosshair/Label.text = s
func show_notification(message):
	$Notification.text = message
	$Interface_animation.play("Notification animation")
	$Notification_timer.start()
	await $Notification_timer.timeout
	$Notification.text = ""
	
