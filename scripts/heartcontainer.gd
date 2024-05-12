extends HBoxContainer

@onready var player = $"../../Player"

@onready var heart_gui = $heartGUI
@onready var heart_gui_2 = $heartGUI2
@onready var heart_gui_3 = $heartGUI3

func _ready():
	player.changedHealth.connect(update)
	update()

func update():
	if player.currentHealth == 3:
		heart_gui.show()
		heart_gui_2.show()
		heart_gui_3.show()
	if player.currentHealth == 2:
		heart_gui.show()
		heart_gui_2.show()
		heart_gui_3.hide()
	if player.currentHealth == 1:
		heart_gui.show()
		heart_gui_2.hide()
		heart_gui_3.hide()
	if player.currentHealth <= 0:
		heart_gui.hide()
		heart_gui_2.hide()
		heart_gui_3.hide()
