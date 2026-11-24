extends Control
@onready var score_label: Label = $EndScore
@onready var high_score_label: Label = $HighScore


var high_score = 0
var score = 0

#connect presses() signals
func _on_restart_button_pressed() -> void: 
	get_tree().reload_current_scene()
	#reload the scene when button is pressed

	#quit the game when button is pressed
func update_scores(points):
	if points > Music.high_score:
		Music.high_score = points
	score = points
	high_score = Music.high_score
	set_current_score()
	set_high_score()
#An attemp to make the score shows up in the panel
func set_current_score():
	score_label.text = "Score: " + str(score)
	
func set_high_score():
	high_score_label.text = "Hi-Score: " + str(high_score)

func _on_quit_pressed() -> void:
	get_tree().quit()
