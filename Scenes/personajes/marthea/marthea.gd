extends CharacterBody2D

var speed := 200

func _physics_process(delta: float) -> void:
	# Dirección (x,y) según las teclas de movimiento
	var dir := Input.get_vector("left", "right", "up", "down")
	velocity = dir * speed
	move_and_slide()

	_update_animation(dir)

func _update_animation(dir: Vector2) -> void:
	var anim := ""

	if dir == Vector2.ZERO:
		# Idle según la última dirección en la que nos movimos
		if velocity.y > 0:
			anim = "idle_down"
		elif velocity.y < 0:
			anim = "idle_up"
		else:
			anim = "idle_side"
	else:
		# Walk según dirección actual
		if abs(dir.y) > abs(dir.x):
			anim = "walk_down" if dir.y > 0 else "walk_up"
		else:
			anim = "walk_side"

	$AnimatedSprite2D.play(anim)
	# Volteo horizontal para izquierda/derecha
	if anim.ends_with("_side"):
		$AnimatedSprite2D.flip_h = dir.x < 0
