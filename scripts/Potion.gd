extends StaticBody2D

func _on_collect_box_area_entered(area):
	if area.is_in_group("player"):
		print("Vanish")
		queue_free()
