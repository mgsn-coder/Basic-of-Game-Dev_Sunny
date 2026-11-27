extends Button

func _on_pressed() -> void:
	GameMaster.playing_2P_mode = true
	GameMaster.load_new_scene("res://Scene/Screens/level_main.tscn")
