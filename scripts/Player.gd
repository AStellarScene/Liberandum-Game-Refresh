extends CharacterBody2D

@onready var timer = $HitBox/Timer
@onready var animated_sprite_2d = $AnimatedSprite2D

@export var maxHealth = 3
@onready var currentHealth: int = maxHealth

signal changedHealth

var collect = 0
var hurt = false

func _physics_process(delta):
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = direction * 250
	move_and_slide()
	
	var isLeft = velocity.x < 0
	var isRight = velocity.x > 0
	var isUp = velocity.y < 0
	var isDown = velocity.y > 0
	
	if isLeft:
		animated_sprite_2d.animation = "face_left"
	if isRight:
		animated_sprite_2d.animation = "face_right"
	if isUp:
		animated_sprite_2d.animation = "face_back"
	if isDown:
		animated_sprite_2d.animation = "front"

func _on_hit_box_area_entered(area):
	if area.is_in_group("potion"):
		print(currentHealth)
		currentHealth += 1
		changedHealth.emit()
	if area.is_in_group("enemy"):
		print(currentHealth)
		currentHealth -= 1
		changedHealth.emit()
