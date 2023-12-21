extends CharacterBody3D
@onready var player_name = "player"
@onready var head = $Collision/Head
@onready var collision = $Collision
@onready var camera = $Collision/Head/Head_bob/Camera
@onready var steps = $Collision/Head/Head_bob/Camera/Steps
@onready var ray = head.get_node("Head_bob/Camera/Raycast")
@onready var compass = camera.get_node("compass")
var crouched = false
var can_move = true
var SPEED = 5.0
const JUMP_VELOCITY = 4.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
func _ready():
	print("Initializing player...")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
func _input(event):
	#вращение камеры
	if (event is InputEventMouseMotion) && (Input.mouse_mode == Input.MOUSE_MODE_CAPTURED) && can_move:
		rotate_y(deg_to_rad(-event.relative.x * Global.sensitivity))
		head.rotate_x(deg_to_rad(-event.relative.y * Global.sensitivity))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89), deg_to_rad(89))
			#проверка на нажатие клавиши взаимодействия "E"
	if can_move:
		if Input.is_action_just_pressed("interact"):
				action()
		if Input.is_action_just_pressed("crouch") && !crouched:
			$Crouch_animation.play("crouch")
			crouched = true
		if !Input.is_action_pressed("crouch") && crouched && !$Celling_check.get_collider():
			$Crouch_animation.play_backwards("crouch")
			crouched = false
		if Input.is_action_pressed("move_left"):
			$Tilt_animation.play("left_tilt")
		elif Input.is_action_pressed("move_right"):
			$Tilt_animation.play("right_tilt")	
		else:
			$Tilt_animation.play("RESET")	
		if Input.is_action_pressed("push"):
			if ray.get_collider() && ray.get_collider().has_method("push"):
				ray.get_collider().call("push")
		if Input.is_action_just_pressed("open_map"):
			if !compass.visible:
				compass.visible = true
				if !$Ingame_interface.is_playing():
					$Ingame_interface.play("Map_open")
			else:
				if !$Ingame_interface.is_playing():
					$Ingame_interface.play("Map_close")
#Функция взаимодействия со стороны игрока
func action():
	if ray.get_collider() && ray.get_collider().has_method("action"):
		ray.get_collider().call("action")
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	#проверка на возможность передвижения
	if can_move:
		# спринт
		if Input.is_action_pressed("sprint") && Input.is_action_pressed("move_forward") && (is_on_floor() || SPEED == 10.0):
			SPEED = 10.0
		#приседания
		elif Input.is_action_pressed("crouch")&& !Input.is_action_pressed("sprint"):
			SPEED = 2.5
		else:
			SPEED = 5.0
		# Handle Jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			$Walk_animation.play("walk")
			if !steps.has_stream_playback():
				steps.play()
			if !is_on_floor():
				steps.stop()
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			$Walk_animation.play("RESET")
			steps.stop()
		move_and_slide()
	

	var object = null
	#наведение на предметы
	if ray.get_collider():
		if "key" in ray.get_collider():
			object = ray.get_collider()
		if object:
			Global.interface.set_cross_label(object.label)
	elif !ray.get_collider():
		Global.interface.set_cross_label(" ")
func activate():
	collision.disabled = false
	can_move = true
	camera.make_current()
	Global.crosshair.visible = true
	$Collision/Head/Head_bob/Camera/Raycast.enabled = true
	print("dismounting")
func deactivate():
	$Collision/Head/Head_bob/Camera/Raycast.enabled = false
	collision.disabled = true
	can_move = false
	Global.crosshair.visible = false
	print("mounting")
