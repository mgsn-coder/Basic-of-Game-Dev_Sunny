extends Button

func _on_pressed() -> void:
	GameMaster.playing_2P_mode = false 
	get_tree().change_scene_to_file("res://Scene/Screens/level_main.tscn")
