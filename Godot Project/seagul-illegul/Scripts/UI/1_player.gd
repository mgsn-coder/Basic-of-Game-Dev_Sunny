extends Button

func _ready() -> void:
	grab_focus() # make 1Player button default choice

func _on_pressed() -> void:
	GameMaster.playing_2P_mode = false 
	get_tree().change_scene_to_file("res://Scene/Screens/level_main.tscn")
