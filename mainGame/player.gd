extends CharacterBody2D


signal healthDepleted
var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
	
	
	const DAMAGERATE = 5.0
	var overlappingMobs = %hurtBox.get_overlapping_bodies()
	if overlappingMobs.size() > 0:
		health -= DAMAGERATE * overlappingMobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			healthDepleted.emit()
