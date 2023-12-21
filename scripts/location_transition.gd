extends Area3D

@export var object_trigger: Node3D
@export var transist_to: String
@export var location: String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):	
	if object_trigger.name == body.name && transist_to && location:
		Global.go_to_next_scene(transist_to)
		

