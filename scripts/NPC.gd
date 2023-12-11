extends Node3D

@export var animation: AnimationPlayer
@export var current_animation: String
func change_animation(new_animation):
	current_animation = new_animation
func _physics_process(delta):
	animation.play(current_animation)



