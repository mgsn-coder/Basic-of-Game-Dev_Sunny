extends Control
@onready var score_lebel: Label = %Score
@onready var high_score_lebel: Label = $Panel/HighScore


var score = 0

#connect presses() signals
func _on_restart_button_pressed() -> void: 
	get_tree().reload_current_scene()
	#reload the scene when button is pressed

	#quit the game when button is pressed

#An attemp to make the score shows up in the panel
#func set_current_score(score):
	#score_lebel.text = "score: " + str(score)
	
#func set_high_score(points):
	#high_score_lebel.text = "Hi-Score: " + str(points)

func _on_quit_pressed() -> void:
	get_tree().quit()
