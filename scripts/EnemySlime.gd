extends CharacterBody2D

@onready var player = $"../Player"
@onready var animated_sprite_2d = $AnimatedSprite2D

var track = false

func _physics_process(delta):
	if track == true:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 130
		move_and_slide()


func _on_detect_box_area_entered(area):
	animated_sprite_2d.play()
	track = true
	$AudioStreamPlayer2D.play()


func _on_detect_box_area_exited(area):
	track = false
	animated_sprite_2d.stop()

func take_damage():
	print("Damage")
	queue_free()
