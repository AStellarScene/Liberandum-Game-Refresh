extends CharacterBody2D

@onready var timer = $HitBox/Timer
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var throwing_point = $ThrowingPoint
@onready var potion_holding = $PotionHolding


@onready var holdingPotion = false
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
		
func throw():
	const POTION = preload("res://scenes/potion_projectile.tscn")
	var new_potion = POTION.instantiate()
	self.add_child(new_potion)
	
func _input(event):
	if event.is_action_pressed("throw"):
		if holdingPotion == true:
			throw()
			holdingPotion = false
			potion_holding.hide()

func _on_hit_box_area_entered(area):
	if area.is_in_group("health"):
		if currentHealth < 3:
			currentHealth += 1
		changedHealth.emit()
		print(currentHealth)
	if area.is_in_group("enemy"):
		if currentHealth > 1:
			currentHealth -= 1
		else:
			$AudioStreamPlayer2D.play()
			get_tree().change_scene_to_file("res://scenes/start.tscn")
		changedHealth.emit()
		print(currentHealth)
	if area.is_in_group("throwing"):
		potion_holding.show()
		print("Grabbed")
		holdingPotion = true
