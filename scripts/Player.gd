extends CharacterBody2D

@onready var label_lives = $"Label-Lives"
@onready var timer = $Hitbox/Timer
@onready var label_collect = $"Label-Collect"
@onready var animated_sprite_2d = $AnimatedSprite2D

var lives = 8
var collect = 0
var hurt = false







func _physics_process(delta):
	var isLeft = velocity.x < 0
	var isRight = velocity.x > 0
	var isUp = velocity.y < 0
	var isDown = velocity.y > 0
	
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * 250
	move_and_slide()
	
	if isLeft:
		animated_sprite_2d.animation = "face_left"
	if isRight:
		animated_sprite_2d.animation = "face_right"
	if isUp:
		animated_sprite_2d.animation = "face_back"
	if isDown:
		animated_sprite_2d.animation = "front"

func _on_hitbox_area_entered(area):
	if area.is_in_group("hurt"):
		print("Hurt!")
		lives = lives - 1
		if lives > 0:
			timer.start()
			hurt = true
			label_lives.text = str(lives)
		else:
			position = Vector2(0, 0)
			lives = 3
			label_lives.text = str(lives)
			get_tree().reload_current_scene()
	if area.is_in_group("collect"):
		collect = collect + 1
		label_collect.text = str(collect) + "/20"
