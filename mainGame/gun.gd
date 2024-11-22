extends Area2D

func _physics_process(delta):
	var enemiesInRange = get_overlapping_bodies()
	if enemiesInRange.size() > 0:
		var targetEnemy = enemiesInRange[0]
		look_at(targetEnemy.global_position)


func shoot():
	const BULLET = preload("res://mainGame/bullet.tscn")
	var newBullet = BULLET.instantiate()
	newBullet.global_position = %shootingPoint.global_position
	newBullet.global_rotation = %shootingPoint.global_rotation
	%shootingPoint.add_child(newBullet)


func _on_timer_timeout():
	shoot()
