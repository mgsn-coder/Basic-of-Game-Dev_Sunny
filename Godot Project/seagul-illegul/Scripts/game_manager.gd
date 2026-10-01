extends Node

@onready var score_lebel : Label = $Score

var score = 0

func add_point():
	score +=1
	score_lebel.text = "Score: " + str(score)
