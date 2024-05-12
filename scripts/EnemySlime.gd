extends CharacterBody2D

@onready var player = $"../Player"

var track = false

func _physics_process(delta):
	if track == true:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * 130
		move_and_slide()


func _on_hit_box_area_entered(area):
	if track == true:
		queue_free()


func _on_detect_box_area_entered(area):
	track = true


func _on_detect_box_area_exited(area):
	track = false

func take_damage():
	print("Damage")
	queue_free()
