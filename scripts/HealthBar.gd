extends ProgressBar

@onready var player = $"../../Player"

func _ready():
	player.changedHealth.connect(update)
	update()

func update():
	value = player.currentHealth * 100 / player.maxHealth
