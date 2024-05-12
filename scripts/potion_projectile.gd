extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const SPEED = 100
	const RANGE = 100
	
	var direction = Vector2.RIGHT
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		$AudioStreamPlayer2D.play()
		queue_free()
		body.take_damage()
