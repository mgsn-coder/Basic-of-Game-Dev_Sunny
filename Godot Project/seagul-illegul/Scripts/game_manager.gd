extends Node

@onready var score_lebel : Label = $Score
@onready var pop_up: Label = $PopupPoint
@onready var player: CharacterBody2D = %Player


var score = 0

func add_point(points):
	score += points
	score_lebel.text = "Score: " + str(score)
	
func print(points):
	pop_up.global_position = player.global_position
	pop_up.text = "+ " + str(points)
	
