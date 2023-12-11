extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.pause(0)
	print("Initializing main scene...")
	Global.game = self
	Global.player = $Player
	Global.interface = $Interface
	Global.crosshair = $Interface/Crosshair
	Global.notification = $Interface/Notification
	Global.vehicle = $Vehicle
	Global.ingame_menu = $Ingame_menu
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Global.pause(1)
		if get_tree().paused:
			$Ingame_menu.visible = 1
		else:
			$Ingame_menu.visible = 0
