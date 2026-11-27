extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grab_focus()

func _on_pressed() -> void:
	GameMaster.load_new_scene("res://Scene/Screens/main_menu.tscn")
