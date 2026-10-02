extends Node

@onready var score_lebel : Label = $Score

var score = 0

func add_point(points):
	score += points
	score_lebel.text = "Score: " + str(score)
