extends Node3D

func _physics_process(_delta):
	if visible:
		$Arrow.rotation.y = Global.player.rotation.y
